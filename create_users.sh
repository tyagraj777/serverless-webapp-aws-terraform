#!/bin/bash

# Set the API Gateway URL
#API_URL="https://<api-id>.execute-api.<region>.amazonaws.com/prod/users"
#API_URL="https://<api-id>.-update API-id below**********"
API_URL="https://xxxxxxxxx.execute-api.us-east-1.amazonaws.com/prod/users"

# Function to generate random strings for user ID and name
generate_random_user() {
  local user_id=$(uuidgen | tr '[:upper:]' '[:lower:]' | head -c 8)
  local user_name="user_$((RANDOM % 10000))"
  echo "{\"user_id\": \"$user_id\", \"user_name\": \"$user_name\"}"
}

# Loop to create 5000 users
total_users=5000
batch_size=50
created_users=0

while [ $created_users -lt $total_users ]; do
  echo "Creating users batch starting at: $created_users"
  for ((i = 0; i < $batch_size && created_users < $total_users; i++)); do
    # Generate a random user
    user_data=$(generate_random_user)

    # Send the POST request
    curl -s -X POST \
      -H "Content-Type: application/json" \
      -d "$user_data" \
      $API_URL &

    created_users=$((created_users + 1))
  done

  # Wait for the batch to complete
  wait
  echo "Batch completed. Total users created so far: $created_users"
done

echo "Finished creating $total_users users."

