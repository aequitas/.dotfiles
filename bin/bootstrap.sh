#!/bin/bash

chmod a+x .bin/*

sudo defaults write com.apple.loginwindow LoginHook ~/login_script.sh
sudo defaults write com.apple.loginwindow LogoutHook ~/logout_script.sh
