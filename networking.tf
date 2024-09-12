resource "aws_network_interface" "public_eni" {
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.allow_all_SSH.id, aws_security_group.allow_all_wg.id]
  tags = {
    Terraform = "true"
    Name      = "quickguard_public_eni"
  }

}

resource "aws_eip" "publicIP" {
  domain            = "vpc"
  network_interface = aws_network_interface.public_eni.id
  tags = {
    Terraform = "true"
    Name      = "quickguard_public_eip"
  }
}

resource "aws_network_interface" "private_eni" {
  subnet_id         = module.vpc.private_subnets[0]
  source_dest_check = false
  tags = {
    Terraform = "true"
    Name      = "quickguard_private_eni"
  }


}



resource "aws_route" "private_vpc_peering_amqp" {


  route_table_id         = module.vpc.private_route_table_ids[0]
  destination_cidr_block = var.jsc_subnet
  gateway_id             = module.vpc.vgw_id
  depends_on             = [module.vpc.private_route_table_ids]

  timeouts {
    create = "5m"
  }
}

resource "aws_route" "public_vpc_peering_amqp" {


  route_table_id         = module.vpc.public_route_table_ids[0]
  destination_cidr_block = var.jsc_subnet
  gateway_id             = module.vpc.vgw_id
  depends_on             = [module.vpc.public_route_table_ids]

  timeouts {
    create = "5m"
  }
}
