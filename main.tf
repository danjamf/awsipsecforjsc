terraform {
  required_providers {
    aws = {
    }
  }

}

provider "aws" {
  region = "us-west-2"
}








#output of Tunnel 1 IP address
output "AWStunnel1IP" {
  value = aws_vpn_connection.main.tunnel1_address
}

#output of Tunnel 2 IP address
output "AWStunnel2IP" {
  value = aws_vpn_connection.main.tunnel2_address
}

#output of Wireguard instance public IP
output "WireguardPublicIP" {
  value = aws_eip.publicIP.public_ip
}
