variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Range da VPC do Desafio"
}

variable "env_prefix" {
  type        = string
  default     = "PROD"
  description = "Ambiente do projeto"
}

variable "subnet_cidr_block" {
  type        = list(any)
  default     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  description = "description"
}

variable "az" {
  type        = list(any)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  description = "description"
}

variable "my_ip" {
  type        = string
  default     = "191.19.104.150/32"
  description = "Meu IP Externo"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Capacidade da Instância"
}

variable "zone_id" {
  type        = string
  description = "Hosted zone"
}

variable "db_pass" {
  type        = string
  description = "RDS Password"
}
