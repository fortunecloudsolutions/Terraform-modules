provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "aws_eks_cluster" {
  source                    = "../../../../modules/eks/eks-cluster"
  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  cluster_iam_role_arn      = var.cluster_iam_role_arn
  vpc_config                = var.vpc_config
  timeouts                  = var.timeouts
  kubernetes_network_config = var.kubernetes_network_config
}


data "template_file" "config" {
  template = file("${path.module}/.kube/config")
  vars = {
    cluster_certificate_authority_data = "${module.aws_eks_cluster.cluster_certificate_authority_data}"
    cluster_server_endpoint            = "${module.aws_eks_cluster.cluster_server_endpoint}"
    cluster_arn                        = "${module.aws_eks_cluster.cluster_arn}"
    cluster_name                       = "${module.aws_eks_cluster.cluster_name}"
    region                             = "${var.region}"
  }
}
