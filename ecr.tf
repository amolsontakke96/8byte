### ECR SETUP ###
resource "aws_ecr_repository" "aws_ecr_repo" {
  name                 = var.aws_ecr_repo_name
  image_tag_mutability = var.aws_ecr_repo_image_tag_mutability
  force_delete         = var.aws_ecr_repo_force_delete
  tags = {
    Name = var.aws_ecr_repo_tag
  }
}

resource "null_resource" "docker_build_and_push" {

  depends_on = [ aws_ecr_repository.aws_ecr_repo ]
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.aws_ecr_repo.repository_url}
      docker build -t ${var.docker_image_name} .
      docker tag ${var.docker_image_name}:latest ${aws_ecr_repository.aws_ecr_repo.repository_url}:latest
      docker push ${aws_ecr_repository.aws_ecr_repo.repository_url}:latest
    EOT
  }
  
}