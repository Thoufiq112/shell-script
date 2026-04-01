#!/bin/bash

USERID=$(id -u)

Validate(){
if [ $1 -ne 0 ] 
then
    echo "$2 ... Failure"
    exit 1
else
    echo "$2 ... Success"
     fi    
}
if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi

dnf list  installed MySQL
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else 
    echo "Mysql is already ... Installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    VALIDATE $? "Installing Git"
else 
   echo "GIT is already ... Installed"
fi
