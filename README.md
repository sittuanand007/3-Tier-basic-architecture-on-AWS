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


          
After Creating main.tf file, we can initialize Terraform and plan the changes by using:

          terraform init
          terraform plan

After checking the changes, we can apply them to create the 3-tier environment by executing this command:

          terraform apply


After execution, we shall have a 3-tier environment running on AWS. The presentation tier will be able to accept HTTP requests, the application tier will be able to process those requests and communicate with the data tier, and the data tier will store the application's data.


