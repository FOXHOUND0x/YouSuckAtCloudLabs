package cmd

import (
	"context"
	"crypto/rand"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os/exec"
	"runtime"
	"strings"

	"github.com/99designs/keyring"

	"github.com/spf13/cobra"
	"golang.org/x/oauth2"
)

const (
	keyringServiceName = "RagnarCLI"
	tokenKey           = "oauth2_token"
)

var oauth2Config = &oauth2.Config{
	// TODO: Add Doppler secrets for these values
	ClientID:     "",
	ClientSecret: "",
	Endpoint: oauth2.Endpoint{
		AuthURL:  "https://ragnar-cli.auth.us-east-1.amazoncognito.com/oauth2/authorize",
		TokenURL: "https://ragnar-cli.auth.us-east-1.amazoncognito.com/oauth2/token",
	},
	RedirectURL: "http://localhost:8080",
	Scopes:      []string{"openid", "email", "profile"},
}

var loginCmd = &cobra.Command{
	Use:   "login",
	Short: "Login to the Ragnar network",
	Long:  `This command is used to login to the Ragnar network.`,
	Run: func(cmd *cobra.Command, args []string) {
		login()
	},
}

func init() {
	rootCmd.AddCommand(loginCmd)
}

func login() {
	verifier := generateCodeVerifier()
	challenge := generateCodeChallenge(verifier)

	authURL := oauth2Config.AuthCodeURL("state",
		oauth2.SetAuthURLParam("code_challenge", challenge),
		oauth2.SetAuthURLParam("code_challenge_method", "S256"))

	fmt.Println("Please visit this URL to authenticate:", authURL)
	openBrowser(authURL)

	code := make(chan string)
	server := &http.Server{Addr: ":8080"}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		receivedCode := r.URL.Query().Get("code")
		if receivedCode == "" {
			fmt.Fprintf(w, "Error: No code received")
			code <- ""
		} else {
			fmt.Fprintf(w, "Authorization code received. Close this MF")
			code <- receivedCode
		}
		go func() {
			server.Shutdown(context.Background())
		}()
	})

	go server.ListenAndServe()

	authCode := <-code
	if authCode == "" {
		fmt.Println("Error: No authorization code received")
		return
	}

	token, err := exchangeCodeForToken(authCode, verifier)
	if err != nil {
		fmt.Printf("Error exchanging code for token: %v\n", err)
		return
	}

	if token.AccessToken == "" {
		fmt.Println("Error: Received empty access token")
		return
	}

	fmt.Println("Access token received. Save to keyring? (y/n)")
	var save string
	fmt.Scanln(&save)

	if strings.ToLower(save) == "y" {
		err = saveToken(token)
		if err != nil {
			fmt.Printf("Error saving token to keyring: %v\n", err)
			return
		}
		fmt.Println("Token saved to keyring")
		fmt.Println("You can now use the CLI to interact with the Ragnar network")
	} else {
		fmt.Println("Token not saved to keyring")
		fmt.Println("Access Token:", token.AccessToken)
		fmt.Println("Refresh Token:", token.RefreshToken)
		fmt.Println("ID Token:", token.Extra("id_token"))
	}
}

func generateCodeVerifier() string {
	b := make([]byte, 32)
	rand.Read(b)
	return base64.RawURLEncoding.EncodeToString(b)
}

func generateCodeChallenge(verifier string) string {
	h := sha256.New()
	h.Write([]byte(verifier))
	return base64.RawURLEncoding.EncodeToString(h.Sum(nil))
}

func exchangeCodeForToken(code, verifier string) (*oauth2.Token, error) {
	form := url.Values{}
	form.Add("grant_type", "authorization_code")
	form.Add("client_id", oauth2Config.ClientID)
	form.Add("code", code)
	form.Add("redirect_uri", oauth2Config.RedirectURL)
	form.Add("code_verifier", verifier)

	req, err := http.NewRequest("POST", oauth2Config.Endpoint.TokenURL, strings.NewReader(form.Encode()))
	if err != nil {
		return nil, fmt.Errorf("error creating request: %v", err)
	}

	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")

	if oauth2Config.ClientSecret != "" {
		req.SetBasicAuth(oauth2Config.ClientID, oauth2Config.ClientSecret)
	}

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error sending request: %v", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("error reading response body: %v", err)
	}

	var token oauth2.Token
	err = json.Unmarshal(body, &token)
	if err != nil {
		return nil, fmt.Errorf("error unmarshalling token: %v", err)
	}

	if token.AccessToken == "" {
		return nil, fmt.Errorf("received empty access token")
	}

	return &token, nil
}

func openBrowser(url string) {
	var err error

	switch runtime.GOOS {
	case "linux":
		err = exec.Command("xdg-open", url).Start()
	case "windows":
		err = exec.Command("rundll32", "url.dll,FileProtocolHandler", url).Start()
	case "darwin":
		err = exec.Command("open", url).Start()
	default:
		err = fmt.Errorf("unsupported platform")
	}

	if err != nil {
		log.Printf("Error opening browser: %v", err)
	}
}

func saveToken(token *oauth2.Token) error {
	ring, err := keyring.Open(keyring.Config{
		ServiceName: keyringServiceName,
	})
	if err != nil {
		return fmt.Errorf("failed to open keyring: %v", err)
	}

	tokenJSON, err := json.Marshal(token)
	if err != nil {
		return fmt.Errorf("failed to marshal token: %v", err)
	}

	err = ring.Set(keyring.Item{
		Key:  tokenKey,
		Data: tokenJSON,
	})
	if err != nil {
		return fmt.Errorf("failed to save token to keyring: %v", err)
	}
	return nil
}
