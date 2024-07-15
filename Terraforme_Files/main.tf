terraform{
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws"{
	region = "us-east-1"
}
data "aws_ami" "app_ami"{
	most_recent = true
	filter{
		name = "name"
		values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
	}
	filter{
		name = "virtualization-type"
		values = ["hvm"]
	}
}

resource "aws_instance" "web"{
	ami= data.aws_ami.app_ami.id
	instance_type = var.instance_type
	tags = {
		Name = "ItTalent04hackathon"
	}
}

