locals {
	all_images = data.oci_core_images.shape_oracle_linux.images
	compartment_images = [for image in local.all_images : image.id if length(regexall("Oracle-Linux-[0-9].[0-9]-20[0-9]*",image.display_name)) > 0 ]
}

resource "oci_core_instance" "graal_server" {
    availability_domain = data.oci_identity_availability_domains.region_availability_domains.availability_domains.0.name
    compartment_id      = var.compartment_ocid
    display_name        = "Graal VM"
    fault_domain        = "FAULT-DOMAIN-1"

	shape               = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "4"
		ocpus         = "1"
	}

    metadata = {
        ssh_authorized_keys = var.ssh_public_key 
    }

    create_vnic_details {
        subnet_id                 = oci_core_subnet.my_public_subnet.id
        display_name              = "primaryvnic"
        assign_public_ip          = true
        assign_private_dns_record = true
        hostname_label            = "graal"
    }

    source_details {
        source_type             = "image"
        source_id               = local.compartment_images.0
        boot_volume_size_in_gbs = "50"
    }
}

resource "null_resource" "remote-exec" {
    depends_on = [oci_core_instance.graal_server]

    provisioner "remote-exec" {
        connection {
            agent       = false
            timeout     = "30m"
            host        = "${oci_core_instance.graal_server.public_ip}"
            user        = "opc"
            private_key = var.ssh_private_key
        }

        inline = [
            "curl -s \"https://get.sdkman.io\" | bash",
            "source \"/home/opc/.sdkman/bin/sdkman-init.sh\"",
            "sdk install java 20.0.1-graal",
            "mkdir $HOME/hello",
            "cat <<EOF > $HOME/hello/HelloOCI.java",
            "public class HelloOCI {",
            "  public static void main(String[] args) {",
            "    System.out.println(\"Hello, OCI People!\");",
            "  }",
            "}",
            "EOF",
            "cd hello",
            "javac HelloOCI.java",
            "native-image HelloOCI",
            "./hellooci"
        ]
    }
}