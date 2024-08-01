#!/usr/local/bin/bash


users = "${user_list}"

for user in $users; do
    echo "Rotating credentials for user: $user"
    # if the username starts with 'Doppler-Dynamic'
    if [[ $user == Doppler-Dynamic* ]]; then
        echo "Skipping user $user"
        continue
    fi
    aws iam delete-access-key --user-name $user --access-key-id $AWS_ACCESS_KEY_ID
done