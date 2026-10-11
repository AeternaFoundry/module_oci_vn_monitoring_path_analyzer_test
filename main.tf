resource "oci_vn_monitoring_path_analyzer_test" "vn_monitoring_path_analyzer_tests" {
  for_each = var.vn_monitoring_path_analyzer_tests

  compartment_id = each.value.compartment_id
  protocol       = each.value.protocol
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  destination_endpoint {
    address                  = each.value.destination_endpoint.address
    instance_id              = each.value.destination_endpoint.instance_id
    listener_id              = each.value.destination_endpoint.listener_id
    load_balancer_id         = each.value.destination_endpoint.load_balancer_id
    network_load_balancer_id = each.value.destination_endpoint.network_load_balancer_id
    psa_id                   = each.value.destination_endpoint.psa_id
    subnet_id                = each.value.destination_endpoint.subnet_id
    type                     = each.value.destination_endpoint.type
    vlan_id                  = each.value.destination_endpoint.vlan_id
    vnic_id                  = each.value.destination_endpoint.vnic_id
  }

  source_endpoint {
    address                  = each.value.source_endpoint.address
    instance_id              = each.value.source_endpoint.instance_id
    listener_id              = each.value.source_endpoint.listener_id
    load_balancer_id         = each.value.source_endpoint.load_balancer_id
    network_load_balancer_id = each.value.source_endpoint.network_load_balancer_id
    psa_id                   = each.value.source_endpoint.psa_id
    subnet_id                = each.value.source_endpoint.subnet_id
    type                     = each.value.source_endpoint.type
    vlan_id                  = each.value.source_endpoint.vlan_id
    vnic_id                  = each.value.source_endpoint.vnic_id
  }

  dynamic "protocol_parameters" {
    for_each = each.value.protocol_parameters != null ? [each.value.protocol_parameters] : []
    content {
      destination_port = protocol_parameters.value.destination_port
      icmp_code        = protocol_parameters.value.icmp_code
      icmp_type        = protocol_parameters.value.icmp_type
      source_port      = protocol_parameters.value.source_port
      type             = protocol_parameters.value.type
    }
  }

  dynamic "query_options" {
    for_each = each.value.query_options != null ? [each.value.query_options] : []
    content {
      is_bi_directional_analysis = query_options.value.is_bi_directional_analysis
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

