package main

import (
	"fmt"
	"net"
	"os"
	"path"
	"testing"
	"time"

	"github.com/pulumi/pulumi/pkg/v3/testing/integration"
	"github.com/tatsushid/go-fastping"
)

func errChk(err error) {
	if err != nil {
		fmt.Println(err)
	}
}

func TestRunTime(t *testing.T) {
	region := os.Getenv("AWS_REGION")
	if region == "" {
		region = "us-east-1"
	}

	cwd, err := os.Getwd()
	if err != nil {
		t.Fatalf("Failed to get current working directory: %v", err)
	}
	integration.ProgramTest(t, &integration.ProgramTestOptions{
		Quick: true,
		SkipRefresh: true,
		Dir: path.Join(cwd),
		DestroyOnCleanup: true,
		Config: map[string]string{
			"aws:region": region,
		},
		ExtraRuntimeValidation: func(t *testing.T, stackInfo integration.RuntimeValidationStackInfo) {
			ping := fastping.NewPinger()
			ra, err := net.ResolveIPAddr("ip4:icmp", stackInfo.Outputs["publicIp"].(string))
			errChk(err)

			ping.AddIPAddr(ra)
			ping.OnRecv = func(addr *net.IPAddr, rtt time.Duration) {
				fmt.Printf("IP Addr: %s receive, RTT: %v\n", addr.String(), rtt)
			}
			ping.OnIdle = func() {
				fmt.Println("finish")
			}
			err = ping.Run()
			errChk(err)			
		},
	})
}