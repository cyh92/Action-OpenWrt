#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i "s/192.168.1.1/$1/g" package/base-files/files/bin/config_generate
echo "设备IP参数为：$1";
#cat package/base-files/files/bin/config_generate
echo "启用无线"
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/disabled='1'/disabled='0'/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc

# Clone Lean's latest sources.
# pushd package
# git clone --depth=1 https://github.com/coolsnowwolf/lede
# popd

# # Copy Lean's packages to ./package/lean.
# mkdir package/lean
# pushd package/lede/package/lean
# cp -r {adbyby,automount,autocore,baidupcs-web,ddns-scripts_aliyun,ddns-scripts_dnspod,dns2socks,frp,ipt2socks,ipv6-helper,kcptun,luci-app-adbyby-plus,luci-app-airplay2,luci-app-arpbind,luci-app-autoreboot,luci-app-baidupcs-web,luci-app-cifs-mount,luci-app-cpufreq,luci-app-familycloud,luci-app-filetransfer,luci-app-frpc,luci-app-frps,luci-app-n2n_v2,luci-app-netdata,luci-app-nfs,luci-app-nps,luci-app-softethervpn,luci-app-usb-printer,luci-app-unblockmusic,luci-app-vsftpd,luci-app-webadmin,luci-app-xlnetacc,luci-app-zerotier,luci-lib-fs,microsocks,n2n_v2,npc,pdnsd-alt,proxychains-ng,redsocks2,shadowsocksr-libev,simple-obfs,softethervpn5,srelay,tcpping,trojan,UnblockNeteaseMusic,UnblockNeteaseMusicGo,v2ray,v2ray-plugin,vsftpd-alt} "../../../lean"
# popd

# # Default settings
# pushd package/lean
# git clone --depth=1 -b default https://github.com/SuLingGG/default-settings

# # Add luci-app-ssr-plus
# git clone --depth=1 https://github.com/fw876/helloworld
# popd

# # Clean Lean's code
# pushd package
# rm -rf lede
# popd

# # Clone community packages to package/community
# mkdir package/community
# pushd package/community

# # Add Lienol's Packages
# git clone --depth=1 https://github.com/SuLingGG/openwrt-package
# rm -rf openwrt-package/lienol/luci-app-ssr-python-pro-server

# # Add mentohust & luci-app-mentohust.
# git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
# git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# # Add ServerChan.
# git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# # Add OpenClash.
# git clone --depth=1 https://github.com/vernesong/OpenClash

# # Add luci-app-onliner. (need luci-app-nlbwmon)
# git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# # Add luci-app-adguardhome.
# git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome

# # Add openwrt-iptvhelper.
# git clone --depth=1 https://github.com/riverscn/openwrt-iptvhelper

# # Add luci-app-diskman.
# git clone --depth=1 https://github.com/lisaac/luci-app-diskman
# mkdir parted
# cp luci-app-diskman/Parted.Makefile parted/Makefile

# # Add luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon

# # Add smartdns
# svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# # Add udptools
# git clone --depth=1 https://github.com/bao3/openwrt-udp2raw
# git clone --depth=1 https://github.com/bao3/openwrt-udpspeeder
# git clone --depth=1 https://github.com/bao3/luci-udptools

# # luci-app-dockerman
# mkdir luci-lib-docker
# wget https://raw.githubusercontent.com/lisaac/luci-lib-docker/master/Makefile -O luci-lib-docker/Makefile
# mkdir luci-app-dockerman
# wget https://raw.githubusercontent.com/lisaac/luci-app-dockerman/master/Makefile -O luci-app-dockerman/Makefile

# # Add tmate
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/tmate
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/msgpack-c

# # Add gotop
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gotop

# # Subscribe converters
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/subconverter
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/jpcre2
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/rapidjson
# popd

# # Remove orig kcptun
# rm -rf ./feeds/packages/net/kcptun

# # Enable irqbalance
# sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config

# # Max connections
# sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# # Remove IPV6
# sed -i 's/ip6tables //g' include/target.mk
# sed -i 's/odhcpd-ipv6only odhcp6c //g' include/target.mk

# # Change dnsmasq to dnsmasq-full
# sed -i 's/dnsmasq i/dnsmasq-full i/g' include/target.mk

# # Convert Translation
# cp ../scripts/convert-translation.sh .
# chmod +x ./convert-translation.sh
# ./convert-translation.sh || true

# Remove upx
# cp ../scripts/remove-upx.sh .
# chmod +x ./remove-upx.sh
# ./remove-upx.sh || true

#设置版本为当前时间
date=`date +%Y.%m.%d`
sed -i -e "/\(# \)\?REVISION:=/c\REVISION:=$date" -e '/VERSION_CODE:=/c\VERSION_CODE:=$(REVISION)' include/version.mk
# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon
# 部分第三方源自带 argon 主题，上面命令删除不掉的请运行下面命令
find ./ -name luci-theme-argon | xargs rm -rf;
#拉取 argon的源码
# git clone --depth=1 https://github.com/cyh92/luci-theme-argon package/luci-theme-argon

git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#全能推送
#git clone https://github.com/cyh92/luci-app-pushbot package/luci-app-pushbot

#git clone https://github.com/ntlf9t/luci-app-easymesh package/luci-app-easymesh

#支持OpenWrt官方源码22.03版本luci-app-zerotier
#find ./ -name luci-app-zerotier | xargs rm -rf;
#git clone https://github.com/zhengmz/luci-app-zerotier package/luci-app-zerotier

#网络设置向导
git clone https://github.com/sirpdboy/luci-app-netwizard package/luci-app-netwizard
#高级设置-Plus
git clone https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
#家长控制
git clone https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
