# Desafio02

Nesse desafio utilizei a criação de:
1 VPC
1 Security Group e suas regras
1 Gateway de internet
1 Route Table
3 Subnets criadas em 3 regiões utilizando o Count
* Instâncias ec2, o número de instâncias é criado de acordo com o length das subnets, nesse exemplo 3
1 loadbalancer que associa dinamicamente de acordo com o length das instâncias
1 instância RDS mult AZ.
1 sub domínio Route 53, o subdomíno é criado apontando ,dinamicamente, para o endpoint do RDS. Assim mantemos os dados centralizados
Dentro das ec2 instalei o Docker e o compose, fiz o download do YML via CURL e executei o docker-compose
Criei para finalizar um subdomínio desafio02 que aponta, dinamicamente, para o loadbalancer

terraform fmt
terraform validate
terraform plan -out plan1
terraform apply plan1
