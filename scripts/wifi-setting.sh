#!/bin/bash

# This script is only for Raspberry Pi 4, Thanks @xmapst

# sed -i 's/36/44/g;s/VHT80/VHT40/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/disabled=1/disabled=0/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh

cat package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
