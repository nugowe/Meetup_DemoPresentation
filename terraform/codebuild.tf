resource "aws_s3_bucket" "codebuildbucket" {
 
  bucket = "codebuildbucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "codebuildbucket" {
 
  bucket = aws_s3_bucket.codebuildbucket.id
  acl    = "public"
}




resource "aws_iam_role_policy" "codebuild_policy" {
  role   = module.myapp-project-vpc.service_role_name
  policy = data.aws_iam_policy_document.codebuild_policy_document.json
}

data "aws_iam_policy_document" "codebuild_policy_document" {

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "ecr:*",
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "ecr:*",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
  }
}


module "myapp-project" {
   

  source = "lgallard/codebuild/aws"

  name        = "meetup_demo"
  description = "Codebuild for deploying myapp"

  # CodeBuild Source
  codebuild_source_version = "main"
  codebuild_source = {
    type            = "GITHUB"
    location        = "https://github.com/nugowe/Meetup_DemoPresentation.git"
    git_clone_depth = 5

    git_submodules_config = {
      fetch_submodules = true
    }
  }

  

  # Environment
  environment = {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:2.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    # Environment variables
    variables = [
      {
        name  = "REGISTRY_URL"
        value = "948612111153.dkr.ecr.us-east-1.amazonaws.com/meetupdemo"
      },
      {
        name  = "AWS_DEFAULT_REGION"
        value = "us-east-1"
      },
    ]
  }

  # Artifacts
  artifacts = {
    location  = aws_s3_bucket.codebuildbucket.bucket
    type      = "S3"
    path      = "/"
    packaging = "ZIP"
  }

  # Cache
  cache = {
    type     = "S3"
    location = aws_s3_bucket.codebuildbucket.bucket
  }

  # Logs
  s3_logs = {
    status   = "ENABLED"
    location = "${aws_s3_bucket.codebuildbucket.id}/build-log"
  }

  # Tags
  tags = {
    Environment = "dev"
    owner       = "development-team"
  }

}