# static-website-on-s3-AWS
🌐 Static Website on AWS with Terraform

This project provisions a secure static website hosting environment on AWS using Terraform.
The infrastructure uses Amazon S3, CloudFront, Route 53, and ACM to deliver content over HTTPS with a custom domain.

🚀 Features
1. Amazon S3 – stores static website files (HTML, CSS, JS).
2. CloudFront (with OAC) – serves content securely with caching and HTTPS.
3. AWS Certificate Manager (ACM) – provides SSL/TLS certificates.
4. Amazon Route 53 – manages DNS records for a custom domain.
5. Terraform IaC – fully automated infrastructure deployment.


<img width="1536" height="1024" alt="obraz" src="https://github.com/user-attachments/assets/faf4954d-b127-429b-b5ee-550dcbd14da1" />

📂 Project Structure
project-static-website/
│── main.tf          # Providers, ACM, Route 53 validation
│── s3.tf            # S3 bucket & settings
│── cloudfront.tf    # CloudFront Distribution + OAC
│── variables.tf     # Input variables
│── outputs.tf       # Output values (URLs, domain)
│── terraform.tfvars # Variable values (domain, zone, etc.)
│── README.md        # Project documentation

⚙️ Prerequisites
- AWS account
- Terraform ≥ 1.5.0
- AWS CLI configured with credentials
- A registered domain in Route 53

🔧 Usage

<b>1. Clone this repository</b>

git clone https://github.com/EvaKN-PL/static-website-on-s3-AWS
cd static-website-on-s3-AWS

2. Initialize Terraform

terraform init
<img width="1267" height="667" alt="obraz" src="https://github.com/user-attachments/assets/10edf0eb-c331-4cca-b5ae-14ba22558034" />


Validate configuration

terraform validate


Plan the deployment

terraform plan -var-file="terraform.tfvars"


Apply changes

terraform apply -var-file="terraform.tfvars"


Upload website files to S3

📌 Variables (terraform.tfvars example)
aws_region    = "your_region"
bucket_name   = "your_bucket_name"
domain_name   = "your_domain"
hosted_zone_id = "Z1234567890ABCDEFG"


