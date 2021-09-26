resource "docker_volume" "my_sql_volume"{
    name = "${var.mysql_volume_name}"
}