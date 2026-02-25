output "instance_name" {
  value = random_pet.instance.id
}
output "instance_id" {
  value = module.ec2-instance.instance_id
}
output "instance_public_ip" {
  value = module.ec2-instance.instance_public_ip
}