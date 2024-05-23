provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}

provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

provider "aws" {
  alias      = "alternate"
  region     = var.region
  access_key = var.access_key_alternate_account
  secret_key = var.secret_key_alternate_account
}

resource "aws_route53_vpc_association_authorization" "example" {
  vpc_id  = var.vpc_id
  zone_id = var.zone_id
}

resource "aws_route53_zone_association" "example" {
  provider = aws.alternate

  vpc_id  = aws_route53_vpc_association_authorization.example.vpc_id
  zone_id = aws_route53_vpc_association_authorization.example.zone_id
}


# module "vpc_associate_auth" {
#   source                  = "../../../modules/route-53/crossaccount-vpc-to-local-route53-zone-associate"
#   zone_id    = var.zone_id
#   vpc_id     = var.vpc_id
#   vpc_region = var.vpc_region
# }

# module "zone_vpc_associate" {
#   source                  = "../../../modules/route-53/crossaccount-vpc-to-local-route53-zone-associate"
#   providers   = {aws = aws.aiops}
#   vpc_region  = var.vpc_region
#   vpc_id      = module.vpc_associate_auth.vpc_id
#   zone_id     = module.vpc_associate_auth.zone_id
#   depends_on = [module.vpc_associate_auth]
# }

# root@pradeep-VirtualBox:crossaccount-vpc-to-local-route53-zone-associate# terraform apply -auto-approve                                                                                             
# data.vault_aws_access_credentials.creds: Refreshing state...                   
# data.vault_aws_access_credentials.creds: Reading... [id=aws/creds/resources/COzzfsoNoIxzyhP9mZiKQdHl]
# data.vault_aws_access_credentials.creds: Read complete after 0s [id=aws/creds/resources/5doVm1dbmhGymLTKaBwd04MV]
# module.vpc_associate_auth.aws_route53_vpc_association_authorization.vpc_associate_auth: Creating...
# module.vpc_associate_auth.aws_route53_vpc_association_authorization.vpc_associate_auth: Still creating... [10s elapsed]
# module.vpc_associate_auth.aws_route53_vpc_association_authorization.vpc_associate_auth: Still creating... [20s elapsed]
# module.vpc_associate_auth.aws_route53_vpc_association_authorization.vpc_associate_auth: Creation complete after 21s [id=Z09886773R2BHXM9EA9E9:vpc-0bc11597a36d29913]
# module.vpc_associate_auth.aws_route53_zone_association.zone_vpc_associate: Creating...
# module.vpc_associate_auth.aws_route53_zone_association.zone_vpc_associate: Still creating... [10s elapsed]

# Error: error associating Route 53 Hosted Zone (Z09886773R2BHXM9EA9E9) to EC2 VPC (vpc-0bc11597a36d29913): NotAuthorizedException: User: arn:aws:iam::046692759124:user/vault-token-terraform-resources-1601592772-4739 is not authorized to perform: route53:AssociateVPCWithHostedZone on resource: arn:aws:ec2:us-east-2:046692759124:vpc/vpc-0bc11597a36d29913
#         status code: 401, request id: 06c927b1-083e-4036-a77f-f452665b540b