#!/bin/bash

sudo defaults write com.apple.loginwindow LoginHook ~/login_script.sh
sudo defaults write com.apple.loginwindow LogoutHook ~/logout_script.sh

brew install lesspipe 
