#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ] 
then
    echo "Installing Mysql ... Failure"
    exit 1
    else
    echo "Installing Mysql ... Success"
    fi
else 
   echo "Mysql is already ... Installed"
fi

# if [ $? -ne 0 ] 
# then
#     echo "Installing Mysql ... Failure"
#     exit 1
#     else
#     echo "Installing Mysql ... Success"
#     fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installing Git ... Failure"
        exit 1
    else 
        echo "Installing Git ... Success"
    fi
else 
   echo "GIT is already ... Installed"
fi

# if [ $? -ne 0 ]
#     then 
#         echo "Installing Git ... Failure"
#         exit 1
#     else 
#         echo "Installing Git ... Success"
#     fi