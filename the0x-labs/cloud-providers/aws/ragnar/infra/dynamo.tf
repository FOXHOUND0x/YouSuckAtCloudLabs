# resource "aws_dynamodb_table" "ragnar_table" {
#     name = "ragnar-url-table"
#     billing_mode = "PROVISIONED"
#     read_capacity = 1
#     write_capacity = 1
#     hash_key = "id"
#     attribute {
#         name = "id"
#         type = "S"
#     }
# }