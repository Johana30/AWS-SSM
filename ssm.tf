resource "aws_ssm_association" "Name-association" {
  name = var.ssm-name
  targets {
    key    = var.ssm-key[0] 
    values = var.ssm-values
  }
}

resource "aws_iam_role" "api_cloudwatch" {
  name = "api_gateway_cloudwatch_global"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy" "api_cloudwatch" {
  name = "cloudwatch_policy"
  role = aws_iam_role.api_cloudwatch.id
  policy = data.aws_iam_policy_document.api_cw.json
}

resource "aws_iam_role" "Admin-EC2" {
  name = "Admin-ec2"
  assume_role_policy = data.aws_iam_policy_document.admin_role_ec2.json  
}

resource "aws_iam_role_policy" "Admin-EC2" {
  name = "admin_policy-EC2"
  role = aws_iam_role.Admin-EC2.id
  policy = data.aws_iam_policy_document.ec2_admin_s3.json
}