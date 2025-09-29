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

<u>**1. Clone this repository**</u>

git clone https://github.com/EvaKN-PL/static-website-on-s3-AWS
cd static-website-on-s3-AWS

<b>2. Initialize Terraform</b>

terraform init
<img width="1267" height="667" alt="obraz" src="https://github.com/user-attachments/assets/10edf0eb-c331-4cca-b5ae-14ba22558034" />


<b>3. Validate configuration</b>

terraform validate

<img width="795" height="122" alt="obraz" src="https://github.com/user-attachments/assets/67541637-a552-4dea-93e3-d1983681671a" />

<b>4. Plan the deployment</b>

terraform plan

<img width="2109" height="528" alt="obraz" src="https://github.com/user-attachments/assets/d5e56777-bb96-4c9e-9437-163bcaca8951" />


<b>5. Apply changes</b>

terraform apply 

<b>6. Upload website files to S3</b>

aws s3 sync ./website/ s3://<your-bucket-name> --delete

* Alternatively, you can upload your website files manually through the AWS Console.

📌 Variables (terraform.tfvars example)
aws_region    = "your_region"
bucket_name   = "your_bucket_name"
domain_name   = "your_domain"
hosted_zone_id = "Z1234567890ABCDEFG"

📤 Outputs

After terraform apply, you will get:

- CloudFront Domain Name
- S3 Bucket Name
- Custom Domain (Route 53)
  
🔐 Security Notes
- The S3 bucket is private – only CloudFront (via OAC) can access it.
- HTTPS is enforced using ACM + CloudFront.
- Public access to S3 is fully blocked.

📜 License

This project is open-source under the MIT License.
Feel free to use and adapt it for your own projects.


