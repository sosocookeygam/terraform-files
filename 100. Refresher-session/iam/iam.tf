resource "aws_iam_role" "test_role" {
  name = "assignment_web_role"
  managed_policy_arns = [aws_iam_policy.s3_access_policy.arn]
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "assignment-role"
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name = "assignment_web_s3_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "web_profile" {
  name = "assignment_web_profile"
  role = aws_iam_role.test_role.name
}

output "instance_profile" {
  value = aws_iam_instance_profile.web_profile.name
}
