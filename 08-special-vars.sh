#!/bin/bash

echo "All Variables passed: $@"
echo "Number of Variables: $#"
echo "Script name: $0"
echo "Present Working Directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running this script: $USER"
echo "Process id of current script:$$"
sleep 60 &
echo "Process id of list command in background: $!"
