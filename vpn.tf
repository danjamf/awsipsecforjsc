
resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = var.jsc_ip
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id        = module.vpc.vgw_id
  customer_gateway_id   = aws_customer_gateway.customer_gateway.id
  type                  = "ipsec.1"
  static_routes_only    = true
  tunnel1_preshared_key = var.psk


}


#create static route to the on-premise network on the AWS VPN side
resource "aws_vpn_connection_route" "onpremNetwork" {
  destination_cidr_block = var.jsc_subnet
  vpn_connection_id      = aws_vpn_connection.main.id
}
