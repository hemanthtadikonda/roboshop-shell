cp mongo.repo /etc/yum.repos.d/mongo.repo
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
cp user.service /etc/systemd/system/user.service
useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable user
systemctl restart user

yum install mongodb-org-shell -y
#update mongodb ip address here
mongo --host mongodb.tadikonda.online </app/schema/user.js