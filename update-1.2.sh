#!/bin/bash
echo "Checking VPS"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/CODETRCK/trysc/main/trysc | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e ""
else
echo "You're not Allowed to use this script"
exit 0
fi
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/trial.sh"
wget -O change "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/CODETRCK/ahhmantap/main/add-tr.sh"
wget -O addgrpc "https://raw.githubusercontent.com/CODETRCK/Mantap/main/xray/addgrpc.sh"
wget -O cekgrpc "https://raw.githubusercontent.com/CODETRCK/Mantap/main/xray/cekgrpc.sh"
wget -O delgrpc "https://raw.githubusercontent.com/CODETRCK/Mantap/main/xray/delgrpc.sh"
wget -O renewgrpc "https://raw.githubusercontent.com/CODETRCK/Mantap/main/xray/renewgrpc.sh"
clear
echo -e "$green   =============================================$NC"
echo -e "$green                 Update Selesai                 $NC"
echo -e "$green   =============================================$NC"
sleep 5
clear
echo -e "$green   =============================================$NC"
echo -e "$green            Proses Restart Akan Dimulakan       $NC"
echo -e "$green   =============================================$NC"
sleep 5
clear
chmod +x change
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo -e "$green   =============================================$NC"
echo -e "$green         Proses Update Telah Selesai            $NC"
echo -e "$green    Sila Tunggu Proses Reboot dan Taip Menu     $NC"
echo -e "$green            Enjoy This Script                   $NC"
echo -e "$green   =============================================$NC"
sleep 15
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
