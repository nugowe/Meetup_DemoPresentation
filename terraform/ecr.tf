


resource "aws_ecr_repository" "meetup" {
  name                 = "Meetup_Demo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "registry arn" {

    value = aws_ecr_repository.meetup.arn
}

output "registry id" {

    value = aws_ecr_repository.meetup.id
}

output "registry arn" {

    value = aws_ecr_repository.meetup.repository_url
}


resource "null_resource" "image_push" {
    depends_on = [
    aws_ecr_repository.meetup.name
  ]

  provisioner "local-exec" {
    command = <<EOF
    #!/bin/bash
    image_name = "worldcupqatar2022"
    image_tag = "latest"
    registryuri = "${aws_ecr_repository.meetup.repository_url}"
    docker build -t $image_name:$image_tag ../Dockerfile
    docker tag $image_name:$image_tag $registryuri:$image_tag
    docker push $registryuri:$image_tag


EOF
  }
    
  }
}
