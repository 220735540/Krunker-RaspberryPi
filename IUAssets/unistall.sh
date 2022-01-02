#!/bin/bash

#Variables
AppName="Krunker"
export PW_PREFIX="$HOME/.local/share/pi-ware"
PACMANG="$(cat $PW_PREFIX/inst-pref)"
fwe=""
ers=""

#Functions
function error {
  echo -e "\e[91m$1\e[39m"
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
warning 5 "Warning: Uninstall $AppName will remove any saved data associated with $AppName. \nTo cancel press CTRL + C in the next 5 seconds."
#Remove AppNames's folder
rm -rf ~/Krunker-RaspberryPi || error 'Failed to remove $AppName folder'
sudo rm -rf ~/.local/share/applications/webapp-Krunker3935.desktop || error 'Failed to unistall app'
sudo rm -rf ~/Desktop/krunker.desktop || error 'Failed to unistall app'
#Inform user that the uninstall has finished
echo 'Uninstall Finished...'
#Check if finished with errors
if [ "${fwe}" == "1" ]; then
  echo "This script finished with errors, Here are the errors: ${ers}"
  sleep 5
  exit 1
elif [ "${fwe}" == "0" ]; then
  echo "Successfully uninstalled $AppName."
  echo "Closing in 5 seconds."
  sleep 5
  exit 0
fi#!/bin/bash

#Variables
AppName="CryApp"
export PW_PREFIX="$HOME/.local/share/pi-ware"
PACMANG="$(cat $PW_PREFIX/inst-pref)"
fwe=""
ers=""

#Functions
function error {
  echo -e "\e[91m$1\e[39m"
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
warning 5 "Warning: Uninstall $AppName will remove any saved data associated with $AppName. \nTo cancel press CTRL + C in the next 5 seconds."
#Remove AppNames's folder
rm -rf ~/CryApp || error 'Failed to remove $AppName folder'
sudo rm -rf ~/.local/share/applications/CryApp || error 'Failed to unistall app'
#Inform user that the uninstall has finished
#Check if finished with errors
if [ "${fwe}" == "1" ]; then
  echo "This script finished with errors, Here are the errors: ${ers}"
  sleep 5
  exit 1
elif [ "${fwe}" == "0" ]; then
  echo "Successfully uninstalled $AppName."
  echo "Closing in 5 seconds."
  sleep 5
  exit 0
fi