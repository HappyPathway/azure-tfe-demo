module "gitclone" {
    source = "git::https://github.com/HappyPathway/terraform-github-repo-clone.git"
    repo_src = "${var.repo_src_owner}/${var.network_repo}"
    repo_dir = "/tmp/${var.network_repo}"
    module = true
}