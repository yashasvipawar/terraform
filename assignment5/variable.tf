variable "container_name" {
 default = "mysql" 
}
variable "mysql_root_password" {
 default = "12345" 
}
variable "mysql_network_name" {
 default = "mysql_internal_network" 
}
variable "mysql_volume_name" {
 default = "mysql_data" 
}