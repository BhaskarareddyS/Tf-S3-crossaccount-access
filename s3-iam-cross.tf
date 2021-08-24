#This step will actually delegate the required permission to the other aws account(destination account).
#Every AWS Account has an account ID number. We will be giving/delegating access to the destination account number in this policy. 
#The policy looks like the below. 

resource "aws_iam_role_policy" "s3_aws_crossaccount_policy" {
  name = "s3_aws_crossaccount_policy"
  role = "role-name"
  policy = <<EOF
{
    "Version": "2008-10-17",
    "Id": "Policy1357935677554",
    "Statement": [
        {
            "Sid": "CrossAccountList",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::111111111111:root"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::examplebucket"
        },
        {
            "Sid": "CrossAccountS3",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::111111111111:root"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::examplebucket/*"
        }
    ]
}

