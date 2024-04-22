module "ec2module" {

  source        = "../../Modules/ec2"
  instance_type = "t2.large"

}

output "mod_ip" {
  value = module.ec2module.ip
}
