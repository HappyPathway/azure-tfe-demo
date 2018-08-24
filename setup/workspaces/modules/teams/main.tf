

resource "tfe_team" "team" {
  name = "${var.team_name}"
  organization = "${var.organization}"
}

resource "tfe_team_members" "member" {
  team_id = "${tfe_team.team.id}"
  usernames = "${var.members}"
}

resource "tfe_team_access" "access" {
    count = "${length(var.workspace_ids)}"
    access = "${var.team_permissions}"
    team_id = "${tfe_team.team.id}"
    workspace_id = "${element(var.workspace_ids, count.index)}"
}