terraform {
  required_version = ">= 0.12.0"
}

### Elastic cache resources 

resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.namespace}-cache-subnet"
  subnet_ids = aws_subnet.default.*.id
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id = var.cluster_id
  replication_group_description = "Redis cluster"

  node_type = "cache.t2.micro"
  port      = 6379
  parameter_group_name = "default.redis6.x.cluster.on"
  

  snapshot_retention_limit = 0

  subnet_group_name = aws_elasticache_subnet_group.default.name

  automatic_failover_enabled = true

  security_group_ids = [
    aws_security_group.redis.id
  ]

  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups = var.node_groups
  }
  
}
resource "aws_security_group" "redis" {

   name_prefix = "web"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

    # security_groups = [
    #   aws_security_group.sg-instance.id
    # ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  
}