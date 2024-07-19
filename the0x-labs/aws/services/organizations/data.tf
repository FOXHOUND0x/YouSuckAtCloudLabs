data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "current" {}

data "aws_organizations_organizational_units" "current" {
  parent_id = data.aws_organizations_organization.current.roots[0].id
}

data "aws_organizations_organizational_unit" "ou" {
  parent_id = data.aws_organizations_organization.current.roots[0].id
  name      = "Security-Tooling"
}
data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.current.account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.slack_notify_account_join.arn,
    ]

    sid = "__default_statement_ID"
  }
}