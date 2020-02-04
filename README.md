AWS Network Module for Banyan Security
======================================

This module creates a VPC and associated subnets to support a multi-zone deployment of the Access Tier from [Banyan Security].

## Usage

```hcl
module "banyan-aws-network" {
    source = "./modules/banyan-network-aws"
    region = "us-east-1"
    zone1 = "us-east-1c"
    zone2 = "us-east-1d"
}
```

If you need larger network blocks, just change the CIDR allocations:

```hcl
module "banyan-aws-network" {
    source = "./modules/banyan-network-aws"
    region = "us-east-1"
    zone1 = "us-east-1c"
    zone2 = "us-east-1d"
    vpc_cidr = "10.0.0.0/8"
    public_cidr1 = "10.0.0.0/16"
    public_cidr2 = "10.0.1.0/16"
    private_cidr1 = "10.0.2.0/16"
    private_cidr2 = "10.0.3.0/16"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| region | Region to create network in | `string` | `"us-east-1"` | **yes** |
| zone1 | Availability zone to create first subnet in | `string` | `"us-east-1a"` | **yes** |
| zone2 | Availability zone to create second subnet in | `string` | `"us-east-1b"` | **yes** |
| vpc\_cidr | Network block to allocate to the entire network | `string` | `"10.0.0.0/22"` | no |
| public\_cidr1 | Subset of VPC block to allocate to first public subnet | `string` | `"10.0.0.0/24"` | no |
| public\_cidr2 | Subset of VPC block to allocate to second public subnet | `string` | `"10.0.1.0/24"` | no |
| private\_cidr1 | Subset of VPC block to allocate to first private subnet | `string` | `"10.0.2.0/24"` | no |
| private\_cidr2 | Subset of VPC block to allocate to second private subnet | `string` | `"10.0.3.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | ID of the VPC that was created for you |
| vpc\_cidr | CIDR block for the entire VPC |
| public\_subnet1\_id | ID of the public subnet created in the first availability zone |
| public\_subnet2\_id | ID of the public subnet created in the second availability zone |
| private\_subnet1\_id | ID of the private subnet created in the first availability zone |
| private\_subnet2\_id | ID of the private subnet created in the second availability zone |

## Authors

Module created and managed by [Todd Radel](https://github.com/tradel).

## License 

Licensed under Apache 2. See [LICENSE](LICENSE) for details.

[Banyan Security]: https://banyansecurity.io
