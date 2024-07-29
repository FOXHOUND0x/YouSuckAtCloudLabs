#!/bin/bash
STORAGE_ACCOUNT_NAME="your_storage_account_name"
FILE_SHARE_NAME="your_file_share_name"
ACCESS_TOKEN=$(cat token.txt)

mkdir -p ~/mnt/$FILE_SHARE_NAME
mount_smbfs "//$STORAGE_ACCOUNT_NAME:$ACCESS_TOKEN@$STORAGE_ACCOUNT_NAME.file.core.windows.net/$FILE_SHARE_NAME" ~/mnt/$FILE_SHARE_NAME
