# terraform-ec2
<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.instance_cpu_balance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.instance_cpu_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route_table_association.association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.sg_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_CPUCreditUsage_per_hour"></a> [CPUCreditUsage\_per\_hour](#input\_CPUCreditUsage\_per\_hour) | CPU credit usage per hour | `number` | n/a | yes |
| <a name="input_ami"></a> [ami](#input\_ami) | AMI ID | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags for all resources | `map(string)` | <pre>{<br>  "Product": "EC2",<br>  "Project": "Terraform"<br>}</pre> | no |
| <a name="input_ec2_type"></a> [ec2\_type](#input\_ec2\_type) | Type of the EC2 instance | `string` | n/a | yes |
| <a name="input_function"></a> [function](#input\_function) | Name of the function | `string` | n/a | yes |
| <a name="input_minimum_cpu_balance"></a> [minimum\_cpu\_balance](#input\_minimum\_cpu\_balance) | Minimum CPU credit balance | `number` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | List of network rules | `map(list(string))` | n/a | yes |
| <a name="input_product_name"></a> [product\_name](#input\_product\_name) | Name of the product | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | n/a | yes |
| <a name="input_public_adress"></a> [public\_adress](#input\_public\_adress) | Public IP address | `bool` | n/a | yes |
| <a name="input_rt_id"></a> [rt\_id](#input\_rt\_id) | ID of the route table | `string` | n/a | yes |
| <a name="input_sns_arn"></a> [sns\_arn](#input\_sns\_arn) | ARN of the SNS topic | `string` | n/a | yes |
| <a name="input_sshkey"></a> [sshkey](#input\_sshkey) | SSH key name | `string` | n/a | yes |
| <a name="input_subnet_metadata"></a> [subnet\_metadata](#input\_subnet\_metadata) | Metadata of the subnets | `map(string)` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_instance_id"></a> [bastion\_instance\_id](#output\_bastion\_instance\_id) | n/a |
<!-- END_TF_DOCS -->