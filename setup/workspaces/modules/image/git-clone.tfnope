module "gitclone" {
    source = "git::https://github.com/HappyPathway/terraform-github-repo-clone.git"
    repo_src = "${var.repo_src_owner}/${var.create_image_repo}"
    repo_dir = "/tmp/${var.create_image_repo}"
    module = true
}