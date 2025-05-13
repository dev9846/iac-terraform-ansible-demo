terraform {
  backend "s3" {
    bucket = "iac-demo-tfstate-dev"      # 🔁 Change this to your actual bucket name
    key    = "env/dev/terraform.tfstate" # Remote state path within the bucket
    region = "ap-south-1"                # Mumbai region
  }
}
