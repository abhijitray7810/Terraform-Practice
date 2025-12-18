module "eks" {
  # Import the EKS module from the Terraform Registry
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  # Cluster information (control plane)
  cluster_name                    = local.name
  cluster_endpoint_private_access  = true
  cluster_endpoint_public_access   = true
  vpc_id                           = module.vpc.vpc_id
  subnet_ids                       = module.vpc.private_subnets
  control_plane_subnet_ids         = module.vpc.intra_subnets

  # Cluster Add-ons
  cluster_addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    core-dns = {
      most_recent = true
    }
  }

  # Node group defaults
  eks_managed_node_group_defaults = {
    instance_types = ["t2.medium"]
    capacity_type  = "SPOT"
  }

  # EKS Managed Node Groups
  eks_managed_node_groups = {
    k8s-cluster-ng = {
      desired_size = 2
      max_size     = 3
      min_size     = 1
      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
    }
  }

  # Tags
  tags = {
    Terraform   = "true"
    Environment = local.env
  }
}
