resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-20-04-x64"
  name = "wordpress"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.otraprueba.id]
  user_data = file("userdata/hola.yml")
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
  }
  
}