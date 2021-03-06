#!/bin/bash

#Variables
AppName="Krunker"
AppLocation="Menu > Games > $AppName"
RepoUrl="https://github.com/220735540/Krunker-RaspberryPi"
export PW_PREFIX="$HOME/.local/share/pi-ware"
PACMANG="$(cat $PW_PREFIX/inst-pref)"
fwe=""
ers=""

#Functions
function error {
  echo -e "\e[91m$1\e[39m"
  sleep 2
  if [ "$2" == "exit" ]; then
    exit 1
  else
    fwe="1"
    ers+="$1"
  fi
}

function warning {
  echo -e "\e[91m$2\e[39m"
  sleep "$1"
}

#Main
#Clone repo
cd ~
git clone $RepoUrl|| error "Unable to clone ${AppName}'s repo!" exit
#Cd into repo
cd ~/Krunker-RaspberryPi/ || error "Unable to cd into ${AppName}!"
#Install Dependencies
./IUAssets/dependencies
#Install app
sudo mv /home/pi/Krunker-RaspberryPi/webapp-Krunker3935.desktop $HOME/.local/share/applications/ || error 'Failed to move application' 
sudo mv /home/pi/Krunker-RaspberryPi/krunker.desktop $HOME/Desktop/ || error 'Failed to move application To Desktop' 
#Inform user that the install has finished
echo 'Install Finished'
#Check if finished with errors
if [ "${fwe}" == "1" ]; then
  echo "This script finished with errors, Here are the errors: ${ers}"
  sleep 1
  exit 1
elif [ "${fwe}" == "0" ]; then
  echo "Successfully installed $AppName. You can find it in %AppLocation."
  echo "Closing in 5 seconds."
  sleep 5s
  exit 0
fi
