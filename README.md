# 3-Tier-basic-architecture-on-AWS
A basic 3-Tier architecture on AWS created with Terraform

Resources created are as following:

          A VPC with the CIDR block 10.0.0.0/16.
          Three subnets: one for the presentation tier, one for the application tier, and one for the data tier.
          An Internet gateway and a NAT gateway.
          A security group for the presentation tier that allows HTTP traffic.
          A security group for the application tier that allows HTTP and SSH traffic.
          A security group for the data tier that allows MySQL traffic.
          An Amazon Relational Database Service (RDS) instance that uses the MySQL engine.
