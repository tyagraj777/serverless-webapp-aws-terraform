import json
import boto3
import os

dynamodb = boto3.resource("dynamodb")
table_name = os.environ["table_name"]
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    try:
        body = json.loads(event["body"])
        user_id = body["user_id"]
        user_name = body["user_name"]

        # Insert user into DynamoDB
        table.put_item(Item={"user_id": user_id, "user_name": user_name})

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "User created successfully!"}),
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Error creating user", "error": str(e)}),
        }

