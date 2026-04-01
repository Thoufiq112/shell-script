#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%m-%s)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

Validate(){
if [ $1 -ne 0 ] 
then
    echo -e "$2 ... $R Failure"
    exit 1
else
    echo -e "$2 ... $G Success"
     fi    
}
echo "Script started executing at: $TIMESTAMP" &>>LOG_FILE

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi

dnf list installed MySQL &>>LOG_FILE
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>LOG_FILE
    VALIDATE $? "Installing Mysql"
else 
    echo -e "Mysql is already ... $Y Installed"
fi

dnf list installed git &>>LOG_FILE
if [ $? -ne 0 ]
then 
    dnf install git -y &>>LOG_FILE
    VALIDATE $? "Installing Git"
else 
   echo -e "GIT is already ... $Y Installed"
fi
