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

menu(){
figlet "Hlang"|lolcat
echo -e "\e[32m[•]\e[34mVirtex Whatsapp\e[0m"
echo -e "\e[32m[•]\e[34mReport Manual\e[0m"
echo -n -e "\e[1mChoose :\e[0m"
read cose
if [ $cose = "1" ]
then
    clear
    _start_
fi

   if [ $cose = "2" ]
   then
       clear
       _mulai_
   fi

      if [ $cose = "3" ]
      then
          clear
          exit
      else
           clear
           echo -e "\e[31mMenu Yang tersedia : \e[32m1,2,3\e[0m"
           menu
      fi
}

_start_(){
figlet "Virtext"|lolcat
echo -e "\e[31mVersion 0.1"
echo
echo -e "\e[32m[•] Download Virtext"
echo "[•] Kirim Virtext"
echo -n Choose ":"
read pilih
if [ $pilih = "1" ]
then
     clear
     cd /sdcard
     mkdir 1.Virtex
     cd 1.Virtex
     wget https://raw.githubusercontent.com/hagirs/browsers/master/virtex.txt
     clear
    echo -e "\e[32mDownload Berhasil\e[0m"
    _start_
fi

if [ $pilih = "2" ]
then
    clear
    brow
fi
}

brow(){
figlet "Virtext"|lolcat
echo
echo -e "\e[32mMasukan Nope Depannya Pake +62"
echo -n Masukan Nope Korban ":"
read nope
echo -n Masukan Virtex ":"
read teks
load
url="https://wa.me/$nope?text=$teks"
if [ -n "$BROWSER" ]; then
     $BROWSER $url
    elif which xdg-open > /dev/null; then
         xdg-open $url
    elif which gnome-open > /dev/null; then
         gnome-open $url
    else 
        echo -e "\e[31mGagal : Periksa Koneksi internet Anda\e[0m"
    fi
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
menu
