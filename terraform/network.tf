# +-------------------------+
# | Creation of the Network |
# +-------------------------+
resource "oci_core_vcn" "my_vcn" {
	compartment_id = var.compartment_ocid
	cidr_block     = "${var.network_cidr}.0.0/16"
	display_name   = "My VCN"
	dns_label      = "graal"
}

resource "oci_core_internet_gateway" "my_internet_gateway" {
    compartment_id = var.compartment_ocid
	display_name   = "My Internet Gateway"
	enabled        = "true"
	vcn_id         = oci_core_vcn.my_vcn.id
}

resource "oci_core_nat_gateway" "my_nat_gateway" {
    compartment_id = var.compartment_ocid
	display_name   = "My NAT Gateway"
	vcn_id         = oci_core_vcn.my_vcn.id
}

resource "oci_core_service_gateway" "my_service_gateway" {
    compartment_id = var.compartment_ocid
	display_name   = "My Service Gateway"
	vcn_id         = oci_core_vcn.my_vcn.id

	services {
		service_id = data.oci_core_services.oci_network_services.services.0.id
	}
}

resource "oci_core_route_table" "route_table_private" {
    compartment_id = var.compartment_ocid
	display_name   = "My Private Route Table"
	vcn_id         = oci_core_vcn.my_vcn.id

	route_rules {
		description       = "Traffic to Internet"
		destination       = "0.0.0.0/0"
		destination_type  = "CIDR_BLOCK"
		network_entity_id = oci_core_nat_gateway.my_nat_gateway.id
	}

	route_rules {
		description       = "Traffic to OCI Services"
		destination       = data.oci_core_services.oci_network_services.services.0.cidr_block
		destination_type  = "SERVICE_CIDR_BLOCK"
		network_entity_id = oci_core_service_gateway.my_service_gateway.id
	}
}

resource "oci_core_default_route_table" "route_table_public" {
    manage_default_resource_id = oci_core_vcn.my_vcn.default_route_table_id
	compartment_id             = var.compartment_ocid
	display_name               = "My Public Route Table"

	route_rules {
		destination       = "0.0.0.0/0"
		destination_type  = "CIDR_BLOCK"
		network_entity_id = oci_core_internet_gateway.my_internet_gateway.id
	}
}

resource "oci_core_security_list" "security_list_private" {
	compartment_id = var.compartment_ocid
	display_name   = "My Private Security List"
	vcn_id         = oci_core_vcn.my_vcn.id

	egress_security_rules {
		destination      = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol         = "all"
		stateless        = "false"
	}
}

resource "oci_core_default_security_list" "security_list_public" {
	manage_default_resource_id = oci_core_vcn.my_vcn.default_security_list_id
	compartment_id             = var.compartment_ocid
	display_name               = "My Public Security List"

	egress_security_rules {
		destination      = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol         = "all"
		stateless        = "false"
	}

	ingress_security_rules {
		protocol    = "6"
		source      = "0.0.0.0/0"
		source_type = "CIDR_BLOCK"
		stateless   = "false"
		tcp_options {
			max = "22"
			min = "22"
		}
	}

	ingress_security_rules {
		protocol    = "6"
		source      = "0.0.0.0/0"
		source_type = "CIDR_BLOCK"
		stateless   = "false"
		tcp_options {
			max = "80"
			min = "80"
		}
	}
}

resource "oci_core_subnet" "my_public_subnet" {
	cidr_block          = "${var.network_cidr}.0.0/24"
	display_name        = "My Public Subnet"
	dns_label           = "internet"
	security_list_ids   = [oci_core_vcn.my_vcn.default_security_list_id]
	compartment_id      = var.compartment_ocid
	vcn_id              = oci_core_vcn.my_vcn.id
	route_table_id      = oci_core_vcn.my_vcn.default_route_table_id
}

resource "oci_core_subnet" "my_private_subnet" {
	cidr_block                 = "${var.network_cidr}.10.0/24"
	display_name               = "My Private Subnet"
	dns_label                  = "intranet"
	prohibit_public_ip_on_vnic = "true"
	security_list_ids          = [oci_core_security_list.security_list_private.id]
	compartment_id             = var.compartment_ocid
	vcn_id                     = oci_core_vcn.my_vcn.id
	route_table_id             = oci_core_route_table.route_table_private.id
}