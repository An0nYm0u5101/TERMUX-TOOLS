#!/bin/bash
clear
if [[ $1 == kısayol || $1 == k || $1 == K ]];then
	cd files
	mv .tools-termux-egitim tools-termux-egitim
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
	printf "\e[32m[✓] tools-termux-egitim}e[0m KISAYOL OLUŞTURULDU"
	echo
	echo
	echo
	exit
fi
kucukad=$(sed -n 1p README.md)
buyukad=$(sed -n 2p README.md)
#################### GÜNCELLEME TARİHİ EKLEME ####################
if [[ $1 == güncelle || $1 == güncelleme ]];then
	echo
	echo
	echo
	printf "\e[33mSON GÜNCELLEME TARİHİ \e[31m>\e[0m $(sed -n 3p README.md |tr -d \"Güncelleme\")"
	echo
	echo
	echo
	history -s $(date +%d.%m.%G)
	history -s $(sed -n 3p README.md |tr -d "Güncelleme")
	read -e -p $'\e[32mTARİH GİRİNİZ \e[31m>\e[0m ' tarih
	echo
	echo
	songuncelleme=$(sed -n 3p README.md |tr -d "Güncelleme ")
	sed -ie "s/$songuncelleme/$tarih/g" $kucukad.sh
	songuncelleme2=$(sed -n 3p README.md |tr -d "Güncelleme ")
	sed -ie "s/$songuncelleme2/$tarih/g" README.md
	echo
	echo
	echo
	printf "\e[32m[*]\e[0m TARİH GÜNCELLENDİ "
	echo
	echo
	if [[ -a $kucukad.she ]];then
		rm $kucukad.she
	fi
	if [[ -a README.mde ]];then
		rm README.mde
	fi
	exit

fi
#################### OTOMATİK GÜNCEKLEME ####################
readme=$(sed -n 3p README.md |tr -d "Güncelleme ")
guncelleme=$(curl -s "https://github.com/termux-egitim/$buyukad" |grep -o $readme)
if [ "$guncelleme" = "$readme" ];then
	echo
else
	kontrol=$(curl -s https://github.com/termux-egitim/$kucukad |grep -o not-found |wc -w)
	if [[ $kontrol == 0 ]];then
		echo
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[0m$buyukad GÜNCELLEME YAPILAMIYOR \e[31m!!!\e[0m"
		echo
		echo
		echo
		echo
		sleep 2
		printf "\e[31m[!]\e[0m $buyukad DEPOSU BULUNAMADI \e[31m!!!\e[0m"
		echo
		echo
		exit
	fi

	echo
	echo
	echo
	printf "\e[32m[*]\e[0m $buyukad GÜNCELLENİYOR "
	echo
	echo
	echo
	sleep 2
	rm -rf *
	rm -rf .git
	git clone https://github.com/termux-egitim/$kucukad
	cd $kucukad
	mv * ../
	mv .git ../
	cd ..
	rm -rf $kucukad
	bash $kucukad.sh
fi
cd files
curl -s "https://github.com/termux-egitim?tab=repositories" |grep "<a href=\"/termux-egitim/" > tool.txt
sed -ie "s/<a href=\"\/termux-egitim\///g" tool.txt
sed -ie "s/\" itemprop=\"name codeRepository\" >//g" tool.txt
cat tool.txt | tr -d " " > tools.txt
bash banner.sh
hatakontrol=$(cat tools.txt |wc -l)
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
	rm tool.txt tools.txt tool.txte
	exit
fi

printf "\e[31m
   //////////// \e[0mTOOLS\e[31m //////////////


\e[92m$(cat -b tools.txt)\e[31m


   ##########################
\e[0m"
echo
echo
echo
read -e -p $'\e[92m termuxeğitim\e[0m@\e[92mtools\e[0m~\e[91m>> \e[0m' sec
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
