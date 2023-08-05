#!/bin/bash

DIRNAME=$( dirname "${BASH_SOURCE[0]}" )

cd ${DIRNAME} && sudo chmod u+x heartbeat.sh && sudo chmod u+x start.sh
sudo openvt -c 7 -s -f -- su kodi -c "bash ${DIRNAME}/heartbeat.sh & /usr/bin/steamlink &"
sudo systemctl stop kodi

exit
