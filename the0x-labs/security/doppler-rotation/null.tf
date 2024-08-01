resource "null_resource" "null" {
    triggers = {
        user_count = length(data.aws_iam_users.users.id)
        user_list = jsonencode(data.aws_iam_users.users.names)
    }

    provisioner "local-exec" {
        command = templatefile("${path.module}/scripts/rotate.sh.tpl", {
            user_list = jsonencode(data.aws_iam_users.users.names)
        })
    }
}