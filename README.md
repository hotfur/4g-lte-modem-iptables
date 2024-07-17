# 4g-lte-modem-iptables
Useful iptables rules for 4G LTE modem devices

This script attempts to migrate some of the 4G LTE MSM8916 Android-based stick modems vulnerabilities by denying access to the device. These devices using Android 4.4.4 which is long obsolete and contains lots of bugs allow exploitation if allowed to connect to the 4G network. Unless you are running OpenStick (which WILL also have vulnerabilites, since it have ceased development long ago), it is not possible to patch all vulnerabilities. The device could act as a Wifi router, but I recommend the wifi function should be disabled to safeguard against attacks. If needed, the other more secure devices such as computer or routers should be used to share Wifi connections. Again, the device might have unexposed hardware vulnerabilities, which are impossible to fix with this mod! 

After apply the mod, only direct USB tethering will work. You will also lose access to the config page (default at 192.168.100.1 unless you changed it).

Apply the mod by copy-paste it in any init script in /system/etc. Remember to remount system partition read-write.
