#resource "tfe_sentinel_policy" "block_allow_all_cidr" {
#  name = "block_allow_all_cidr"
#  organization = "${var.organization}"
#  policy = "${file("${path.module}/policies/block_allow_all_cidr.sentinel.tpl")}"
#  enforce_mode = "hard-mandatory"
#}

resource "tfe_sentinel_policy" "whitelist_image_ids" {
  name = "whitelist_image_ids"
  organization = "${var.organization}"
  policy = "${file("${path.module}/policies/whitelist_image_ids.sentinel.tpl")}"
  enforce_mode = "hard-mandatory"
}

resource "tfe_sentinel_policy" "vm_size" {
  name = "vm_size"
  organization = "${var.organization}"
  policy = "${file("${path.module}/policies/vm_size.sentinel.tpl")}"
  enforce_mode = "hard-mandatory"
}

