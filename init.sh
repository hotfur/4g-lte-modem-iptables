### IPv4
# Set default policies to DROP
/system/bin/iptables -P INPUT DROP
/system/bin/iptables -P FORWARD DROP
/system/bin/iptables -P OUTPUT DROP
# Allow established and related connections
/system/bin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/system/bin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
/system/bin/iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Allow incoming connections on rndis0 and bridge interface
/system/bin/iptables -A INPUT -i rndis0 -j ACCEPT
/system/bin/iptables -A FORWARD -i rndis0 -j ACCEPT
/system/bin/iptables -A OUTPUT -o rndis0 -j ACCEPT
/system/bin/iptables -A INPUT -i bridge1 -j ACCEPT
/system/bin/iptables -A FORWARD -i bridge1 -j ACCEPT
/system/bin/iptables -A OUTPUT -o bridge1 -j ACCEPT
/system/bin/iptables -A FORWARD -i rmnet0 -o rndis0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/system/bin/iptables -A FORWARD -i rmnet0 -o bridge1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/system/bin/iptables -A OUTPUT -o rmnet0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT


### IPv6
# Set default policies to DROP
/system/bin/ip6tables -P INPUT DROP
/system/bin/ip6tables -P FORWARD DROP
/system/bin/ip6tables -P OUTPUT DROP
# Allow established and related connections
/system/bin/ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/system/bin/ip6tables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
/system/bin/ip6tables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Allow incoming connections on rndis0 and bridge interface
/system/bin/ip6tables -A INPUT -i rndis0 -j ACCEPT
/system/bin/ip6tables -A FORWARD -i rndis0 -j ACCEPT
/system/bin/ip6tables -A OUTPUT -o rndis0 -j ACCEPT
/system/bin/ip6tables -A INPUT -i bridge1 -j ACCEPT
/system/bin/ip6tables -A FORWARD -i bridge1 -j ACCEPT
/system/bin/ip6tables -A OUTPUT -o bridge1 -j ACCEPT
/system/bin/ip6tables -A FORWARD -i rmnet0 -o rndis0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/system/bin/ip6tables -A FORWARD -i rmnet0 -o bridge1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/system/bin/ip6tables -A OUTPUT -o rmnet0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT
