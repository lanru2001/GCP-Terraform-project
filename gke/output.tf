output "cluster_username" {
  value = google_container_cluster.my_cluster.master_auth[0].username
}

output "cluster_password" {
  value = google_container_cluster.my_cluster.master_auth[0].password
}

output "endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}

output "instance_group_urls" {
  value = google_container_cluster.my_cluster.instance_group_urls
}

output "node_config" {
  value = google_container_cluster.my_cluster.node_config
}

output "node_pools" {
  value = google_container_cluster.my_cluster.node_pool
}
