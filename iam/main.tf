resource "aws_iam_user" "user" {
  name = "myuser"
}

resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "policy" {
  name   = "mypolicy"
  user   = aws_iam_user.user.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": "ec2:*",
          "Effect": "Allow",
          "Resource": "*"
      },
      {
          "Effect": "Allow",
          "Action": "elasticloadbalancing:*",
          "Resource": "*"
      },
      {
          "Effect": "Allow",
          "Action": "cloudwatch:*",
          "Resource": "*"
      },
      {
          "Effect": "Allow",
          "Action": "autoscaling:*",
          "Resource": "*"
      },
      {
          "Effect": "Allow",
          "Action": "iam:CreateServiceLinkedRole",
          "Resource": "*",
          "Condition": {
              "StringEquals": {
                  "iam:AWSServiceName": [
                      "autoscaling.amazonaws.com",
                      "ec2scheduled.amazonaws.com",
                      "elasticloadbalancing.amazonaws.com",
                      "spot.amazonaws.com",
                      "spotfleet.amazonaws.com",
                      "transitgateway.amazonaws.com"
                  ]
              }
          }
      }
  ]
}
  EOF
}

resource "aws_iam_group" "mygroup" {
  name = "test_group"

}