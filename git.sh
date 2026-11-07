git config --global credential.helper store
read -p "Enter Github Name: " git_name
read -p "Enter Github Name: " git_email
git config user.name $git_name
git config user.email $git_email
