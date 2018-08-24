import "tfplan"

get_vms = func() {
    vms = []
    for tfplan.module_paths as path {
        vms += values(tfplan.module(path).resources.azurerm_virtual_machine) else []
    }
    return vms
}


allowed_image_ids = [
    "/subscriptions/c0a607b2-6372-4ef3-abdb-dbe52a7b56ba/resourceGroups/PackerConfigs/providers/Microsoft.Compute/images/redis-server-1.2.1",
    "/subscriptions/c0a607b2-6372-4ef3-abdb-dbe52a7b56ba/resourceGroups/PackerConfigs/providers/Microsoft.Compute/images/redis-server-1.2.0",
    "/subscriptions/c0a607b2-6372-4ef3-abdb-dbe52a7b56ba/resourceGroups/PackerConfigs/providers/Microsoft.Compute/images/redis-server-1.2.1-West_US",
]

vms = get_vms()
vm_image_id_allowed = rule {
    all vms as _, instances {
      all instances as index, r {
       # Two possible ways to restrict image ID
  	   r.applied.storage_image_reference[0].id in allowed_image_ids
       #r.applied.storage_image_reference[0].id matches "/subscriptions/<subscription_id>/(.*)[Win|RHEL](.*)"
      }
    }
}

main = rule {
  (vm_image_id_allowed) else true
}
