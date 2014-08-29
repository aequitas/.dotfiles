#!/bin/bash

ungit="node /usr/local/share/npm/bin/ungit --launchBrowser 0"

pkill -f "$ungit"

cd ~/Projects
nohup $ungit &

sleep 1

tail nohup.out

rm nohup.out
