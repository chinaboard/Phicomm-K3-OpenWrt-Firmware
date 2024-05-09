#!/bin/bash
#
# Copyright (c) 2020-2024 JE <https://gihub.com/JE668>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/JE668/Phicomm-K3-LEDE-Firmware-Lean
# File name: beta/diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#1.'asus_dhd24' 2.'ac88u_20' 3.'69027'
firmware='69027'
echo '替换无线驱动'
pwd
ls
ls package/lean/
ls package/lean/k3-brcmfmac4366c-firmware/
ls package/lean/k3-brcmfmac4366c-firmware/files/
ls package/lean/k3-brcmfmac4366c-firmware/files/lib/
ls package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/
ls package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/

wget -nv https://github.com/JE668/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '=========Replace k3 wireless firmware OK!========='



echo '添加AdguardHome'

git clone https://github.com/kongfl888/luci-app-adguardhome package/lean/luci-app-adguardhome 
echo '=========Add AdguardHome OK!========='

echo '添加lwz322的K3屏幕插件'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/JE668/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/JE668/k3screenctrl_build.git package/lean/k3screenctrl/
echo '=========Replace k3screen drive plug OK!========='

echo '添加OpenClash'
rm -rf package/lean/luci-app-openclash
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master
echo '=========Add OpenClash source OK!========='



