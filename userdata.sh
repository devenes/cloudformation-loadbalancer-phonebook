#! /bin/bash


yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# Add GitHub Token if your repository is private
# TOKEN="****************************************"
# FOLDER="https://$TOKEN@raw.githubusercontent.com/devenes/private-projects/main/Phonebook-Application/"
FOLDER="https://raw.githubusercontent.com/devenes/private-projects/main/Phonebook-Application/"
curl -s --create-dirs -o "/home/ec2-user/templates/index.html" -L "$FOLDER"templates/index.html
curl -s --create-dirs -o "/home/ec2-user/templates/add-update.html" -L "$FOLDER"templates/add-update.html
curl -s --create-dirs -o "/home/ec2-user/templates/delete.html" -L "$FOLDER"templates/delete.html
curl -s --create-dirs -o "/home/ec2-user/phonebook-app.py" -L "$FOLDER"phonebook-app.py
python3 /home/ec2-user/phonebook-app.py
# - MyDBURI: !GetAtt MyDatabaseServer.Endpoint.Address