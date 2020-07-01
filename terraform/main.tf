resource "aws_instance" "marc_app" {
  ami             = "${var.ami}"
  key_name        = "key_pair"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_default_security_group.default.id}"]
  count           = "1"

  tags {
    Name = "${var.instance_name}"
  }

  volume_tags {
    Name = "${var.instance_name}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/home/ubuntu"
  }

  # Change permissions on bash script and execute from ubuntu
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/script.sh",
      "bash /home/ubuntu/script.sh",
    ]
  }

  # Login to the ubuntu with the aws key.
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = "${file("${var.keyPath}")}"
    host        = "${self.public_ip}"
  }
}

output "marc_app_ip" {
  value = "${aws_instance.marc_app.public_ip}"
}
