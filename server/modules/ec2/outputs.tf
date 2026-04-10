output "launch_template_name" {
  value = launch_template.control_plane.this.name

}

output "auto_scaling_group" {
  value = auto_scaling_group.this.name

}
