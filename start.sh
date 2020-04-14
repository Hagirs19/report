load(){
echo -e "\n"
    bar=" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}

_mulai_(){
figlet "Report"|lolcat
echo -e "\e[32m•Manual\e[0m"
echo
echo -e -n "\e[32mMasukan ID korban :\e[31m"
read idn
load
urls="https://mbasic.facebook.com/report/id/?id=$idn"
if [ -n "$BROWSER" ]; then
     $BROWSER $urls
    elif which xdg-open > /dev/null; then
         xdg-open $urls
    elif which gnome-open > /dev/null; then
         gnome-open $urls
    else
         echo -e "\e[31mGagal : Perikasa Koneksi Internet Anda\e[0m"
    fi
}
clear
_mulai_
