yum install maven -y
cp shipping.service /etc/systemd/system/shipping.service
useradd roboshop
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
systemctl daemon-reload
systemctl enable shipping
yum install mysql -y
# update mongodb ip address here
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping