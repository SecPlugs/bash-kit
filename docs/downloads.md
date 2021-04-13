# SecPlugs Bash Kit Downloads Page

Browse the source repository or download the raw .sh files below

## BashFileProxyExample.sh
A script that uploads a file for scanning and displays the result with a link to the report in the secplugs portal
### Download
[BashFileProxyExample.sh](https://raw.githubusercontent.com/SecPlugs/bash-kit/main/BashFileProxyExample.sh) 
### Usage
Paste the following into any BASH shell to send eicar for analysis. 
```console
curl https://raw.githubusercontent.com/SecPlugs/bash-kit/main/BashFileProxyExample.sh -o ./BashFileProxyExample.sh 
chmod +x ./BashFileProxyExample.sh
./BashFileProxyExample.sh
```
Specify the path to a file as an argument e.g. to scan '/tmp/filetoscan.exe'
```console
./BashFileProxyExample.sh /tmp/filetoscan.exe
```