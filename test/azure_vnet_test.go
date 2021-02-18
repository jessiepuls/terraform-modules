package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVnetSetup(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../azure/vnet",
		Vars: map[string]interface{}{
			"vnet_name": "terratest-vnet",
			"location":  "East US",
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "resource_group_name")
	assert.Equal(t, "terratest-vnet-resource-group", output)
}
