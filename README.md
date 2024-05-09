
# Phicomm K3 OpenWrt Firmware 🚀
该项目提供了针对 Phicomm K3 路由器的 OpenWrt 固件，旨在提供更多功能和定制选项。

该固件基于 [Lean 的 OpenWrt 源码](https://github.com/coolsnowwolf/lede)，并整合了以下主要插件及功能。

后台地址：[10.0.0.1](10.0.0.1)

## 一、主要插件

- [Adguardhome](https://github.com/kongfl888/luci-app-adguardhome) 🛡️
- [OpenClash](https://github.com/vernesong/OpenClash) 🌐
- [K3 Screen](https://github.com/lwz322/k3screenctrl_build)🖥️


## 二、无线功率调整

如果需要调整无线功率，可以按照以下步骤进行操作：

1. 进入系统-启动项-本地启动脚本
2. 复制以下代码至 "exit 0" 之前:
```shell

iwconfig wlan0 txpower 20
iwconfig wlan1 txpower 20

```
3. 保存&应用
4. 重启路由器
