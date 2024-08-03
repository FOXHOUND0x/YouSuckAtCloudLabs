package main

import (
	"context"
	"encoding/json"
	"log"
	"os"
	"strings"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/s3"
)

var (
	s3Client *s3.Client
	bucket   string
)

type ShortenRequest struct {
	URL string `json:"url"`
}

type ShortenResponse struct {
	ShortCode string `json:"short_code"`
}

func init() {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err != nil {
		log.Fatal(err)
	}
	s3Client = s3.NewFromConfig(cfg)
	bucket = os.Getenv("S3_BUCKET")
}

func handleRequest(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	switch request.HTTPMethod {
	case "POST":
		return handleShorten(ctx, request)
	case "GET":
		return handleRedirect(ctx, request)
	default:
		return events.APIGatewayProxyResponse{StatusCode: 405}, nil
	}
}

func handleShorten(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var shortenReq ShortenRequest
	err := json.Unmarshal([]byte(request.Body), &shortenReq)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 400}, err
	}

	shortCode := generateShortCode()
	_, err = s3Client.PutObject(ctx, &s3.PutObjectInput{
		Bucket: &bucket,
		Key:    &shortCode,
		Body:   strings.NewReader(shortenReq.URL),
	})
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	response, _ := json.Marshal(ShortenResponse{ShortCode: shortCode})
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       string(response),
	}, nil
}

func handleRedirect(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	shortCode := request.PathParameters["shortCode"]
	result, err := s3Client.GetObject(ctx, &s3.GetObjectInput{
		Bucket: &bucket,
		Key:    &shortCode,
	})
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 404}, nil
	}
	defer result.Body.Close()

	var url string
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 302,
		Headers:    map[string]string{"Location": url},
	}, nil
}

func generateShortCode() string {
	return "abc123" // TODO: Do this.
}

func main() {
	lambda.Start(handleRequest)
}
