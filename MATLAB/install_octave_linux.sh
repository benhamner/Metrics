#! /usr/bin/env sh

yes | sudo apt-add-repository ppa:octave/stable > /dev/null
sudo apt-get -qq update
sudo apt-get -qq install octave > /dev/null