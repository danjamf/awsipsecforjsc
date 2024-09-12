variable "jsc_ip" {
  description = "Value of the JSC tunnel address"
  type        = string
  default     = "163.123.174.1"
}

variable "psk" {
  description = "Value of tunnel PSK"
  type        = string
  default     = "wavb3nq3zzc0yvpfn3t6rtz0g89mlayxija2y99t"
}

variable "jsc_subnet" {
  description = "subnet on the JSC side of tunnel"
  type        = string
  default     = "192.168.253.0/24"
}
