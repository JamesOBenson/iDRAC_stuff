#!/bin/bash

#FOR MAC OS: 
# brew tap caskroom/cask
# brew tap caskroom/versions
# brew cask install java6

# Verify version 6 is installed (and other versions)
# /usr/libexec/java_home -V

echo -n 'Host: '
read drachost

FILE="avctKVM.jar"
if [ ! -f $FILE ]; then
    echo "KVM file does not exist..."
    echo "Downloading..."
# This link is from the viewer.jnlp file. 
# It is a necessary file.
    wget https://$drachost:443/software/avctKVM.jar
fi

#echo -n 'Username: '
read -p "Username: " dracuser
dracuser=${dracuser:-root}

echo -n 'Password: '
read -s dracpwd
echo

/usr/bin/java -cp avctKVM.jar -Djava.library.path=./lib com.avocent.idrac.kvm.Main ip=$drachost kmport=5900 vport=5900 user=$dracuser passwd=$dracpwd apcp=1 version=2 vmprivilege=true "helpurl=https://$drachost:443/help/contents.html"
