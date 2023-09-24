provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "all" {
  name = "all-trafic"
  description = "Allow all"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}


resource "aws_instance" "hello" {
ami = data.aws_ami.ubuntu.image_id
#  ami           = "ami-0261755bbcb8c4a84" 
  instance_type = "t2.micro"
  key_name      = "redacretask"

  root_block_device {
    volume_size = 20
  }

  vpc_security_group_ids = [aws_security_group.all.id]

  provisioner "file" {
    source      = "/home/fasihamjad-aik/tasksred/task1" 
    destination = "/home/ubuntu/"
  }

  provisioner "remote-exec" {
    inline = [
      # Install Docker
      "sudo apt update",
      "echo 'Command 1 completed'",
      "sudo apt-get install ca-certificates curl gnupg",
      "echo 'Command 2 completed'",
      "sudo install -m 0755 -d /etc/apt/keyrings",
      "echo 'Command 3 completed'",
      "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
      "echo 'Command 4 completed'",
      "sudo chmod a+r /etc/apt/keyrings/docker.gpg",
      "echo 'Command 5 completed'",
      "sudo echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "echo 'Command 6 completed'",
      "sudo apt-get update",
      " echo 'Command 7 completed'",
      "sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y",
      "echo 'Command 8 completed'",      

      
      # Run Docker Compose command
      "cd /home/ubuntu/task1", # Change to the directory where your Docker Compose files are located
      "echo 'Command 9 completed'",
      "sudo docker compose up -d --build"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("/home/fasihamjad-aik/Downloads/redacretask.pem")}"
    host        = "${self.public_dns}"
  }
}
