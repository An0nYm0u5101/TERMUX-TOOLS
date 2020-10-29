#!/bin/bash
clear
if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
hatakontrol=$(curl -s https://github.com/termux-egitim |wc -l)
if [[ $hatakontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[31m
	[!]\e[31m \e[0mHATA OLUŞTU \e[31m!!!\e[33m

	[*] \e[0mİNTERNET BAĞLANTINIZI KONTROL EDİN
	"
	echo
	echo
	echo
	exit
fi
if [[ $1 == kısayol || $1 == k || $1 == K ]];then
	cd files
	cp .tools-termux-egitim tools-termux-egitim
	mv tools-termux-egitim /data/data/com.termux/files/usr/bin
	cd ..
	mkdir $HOME/.TERMUX-EGITIM
	mv * $HOME/.TERMUX-EGITIM
	mv .git $HOME/.TERMUX-EGITIM
	cd ..
	if [[ -a TERMUX-EGITIM ]];then
		rm -rf TERMUX-EGITIM
	fi
	if [[ -a termux-egitim ]];then
		rm -rf  termux-egitim
	fi
	chmod 777 /data/data/com.termux/files/usr/bin/tools-termux-egitim
	cd $HOME/.TERMUX-EGITIM
	chmod 777 termux-egitim.sh
	echo
	echo
	echo
	printf "\e[32m[✓] tools-termux-egitim\e[0m KISAYOL OLUŞTURULDU"
	echo
	echo
	echo
	exit
fi
cd files
bash güncelleme.sh
curl -s "https://github.com/termux-egitim?tab=repositories" |grep "<a href=\"/termux-egitim/" > tool.txt
sed -ie "s/<a href=\"\/termux-egitim\///g" tool.txt
sed -ie "s/\" itemprop=\"name codeRepository\" >//g" tool.txt
cat tool.txt | tr -d " " > tools.txt
bash banner.sh
sayi=$(cat tools.txt |wc -l)
printf "\e[31m
   //////////// \e[97mTOOLS\e[31m //////////////
   
   "
for no in `seq 1 $sayi` ; do
	if [[ $no -le 9 ]];then
		printf "
		\e[97m[$no]  \e[32m $(sed -n $no\p tools.txt)
		"
	elif [[ $no -gt 9 ]];then
		printf "
		\e[97m[$no] \e[32m $(sed -n $no\p tools.txt)
		"
	fi
done

echo
echo
echo
read -e -p $' \e[92mtermuxeğitim\e[97m@\e[92mtools\e[97m~\e[91m>> \e[0m' sec
if [[ $sec == x || $sec == X || $sec == exit ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[0m ÇIKIŞ YAPILDI \e[31m!!!\e[0m"
	echo
	echo
	echo
	rm tool.txt tools.txt tool.txte
	exit
elif [[ $sec == telegram || $sec == TELEGRAM ]];then
	am start -a android.intent.action.VIEW https://t.me/termuxegitimm
	exit
elif [[ $sec == instagram || $sec == İNSTAGRAM ]];then
	am start -a android.intent.action.VIEW https://www.instagram.com/termuxegitim
	exit
elif [[ $sec == youtube || $sec == YOUTUBE ]];then
	am start -a android.intent.action.VIEW https://m.youtube.com/channel/UCE3QvczZXklHSAaRFwDLP5g
	exit
elif [[ $sec == github || $sec == GİTHUB ]];then
	am start -a android.intent.action.VIEW https://github.com/termux-egitim
	exit
fi
satir=$(cat tools.txt |wc -l)
if [[ $sec -gt $satir ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[0m HATALI SEÇİM \e[31m!!!\e[0m"
	echo
	echo
	echo
	rm tool.txt tools.txt tool.txte
	exit
fi
if [[ $sec -le 0 ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[0m HATALI SEÇİM \e[31m!!!\e[0m"
	echo
	echo
	echo
	rm tool.txt tools.txt tool.txte
	exit
fi
echo
echo
echo
printf "\e[32m[✓]\e[92m $(sed -n $sec\p tools.txt) \e[0m HOME DİZİNİNE İNDİRİLİYOR "
echo
echo
echo
git clone https://github.com/termux-egitim/$(sed -n $sec\p tools.txt)
mv $(sed -n $sec\p tools.txt) $HOME
rm tool.txt tools.txt tool.txte

