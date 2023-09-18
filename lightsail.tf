resource "aws_lightsail_instance" "lightsail_server" {
  name               = "lightsail_server_instance"
  availability_zone  = "us-east-1b"  # Change this to your preferred AWS availability zone
  blueprint_id       = "amazon_linux_2"  # Blueprint ID for Amazon Linux 2
  bundle_id          = "nano_2_0"  # Change this to your preferred bundle ID
  #key_pair_name      = "your_key_pair_name"  # Specify your key pair name here

  user_data          = <<-EOT
                        #!/bin/bash
                        sudo yum install httpd -y
                        sudo systemctl start httpd
                        sudo systemctl enable httpd
                        sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
                      EOT
}

output "lightsail_instance_public_ip" {
  value = aws_lightsail_instance.lightsail_server.public_ip
  description = "The public IP of the Lightsail instance"
}