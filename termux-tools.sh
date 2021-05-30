#!/bin/bash
clear
if [[ $1 == update ]];then
	cd files
	bash update.sh update $2
	exit
fi

# CURL  PAKET KONTROLÜ #

if [[ ! -a $PREFIX/bin/curl ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURLUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi

control=$(ping -c 1 github.com |wc -l)
if [[ $control == 0 ]];then
	echo
	echo
	echo
	printf "\e[1;31m
	[!] \e[97mHATA OLUŞTU \e[31m!!!\e[33m

	[*] \e[97mİNTERNET BAĞLANTINIZI KONTROL EDİN
	"
	echo
	echo
	echo
	exit
fi
if [[ ! -a $PREFIX/bin/tools-termux ]];then
	cd files
	cp .tools-termux /data/data/com.termux/files/usr/bin/tools-termux
	cd ..
	mkdir $HOME/.TERMUX-TOOLS
	mv * $HOME/.TERMUX-TOOLS
	mv .git $HOME/.TERMUX-TOOLS
	cd ..
	rm -rf $(cat .TERMUX-TOOLS/.git/config |grep url |awk -F '/' '{print $5}')
	chmod 777 /data/data/com.termux/files/usr/bin/tools-termux
	chmod 777 $HOME/.TERMUX-TOOLS/termux-tools.sh
	echo
	echo
	echo
	printf "\e[32m[✓] tools-termux\e[0m KISAYOL OLUŞTURULDU"
	echo
	echo
	echo
	exit
fi
cd files
bash update.sh
if [[ -a ../updates_infos ]];then
	rm ../updates_infos
	exit
fi
bash banner.sh
curl -s "https://github.com/termuxxtoolss?tab=repositories" |grep "<a href=\"/termuxxtoolss/" > tool.txt
sed -ie "s/<a href=\"\/termuxxtoolss\///g" tool.txt
sed -ie "s/\" itemprop=\"name codeRepository\" >//g" tool.txt
cat tool.txt | tr -d " " |grep -v termuxxtoolss.github.io > tools.txt
total=$(cat tools.txt |wc -l)
color=$(cat .color.txt)
for no in `seq 1 $total` ; do
	if [[ $no -le 9 ]];then
		printf "
		          \e[97m[$no]  $color $(sed -n $no\p tools.txt)
		"
	elif [[ $no -gt 9 ]];then
		printf "
		          \e[97m[$no] $color $(sed -n $no\p tools.txt)
		"
	fi
done
echo
echo
echo
read -e -p $' \e[92mtermuxx\e[97m@\e[92mtoolss\e[97m~\e[91m>> \e[0m' secim
if [[ $secim == x || $secim == X || $secim == exit ]];then
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
total=$(cat tools.txt |wc -l)
if [[ $secim -gt $total ]];then
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
if [[ $secim -le 0 ]];then
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
directory="$HOME"
directory_name='HOME'
if [[ -n $1 ]];then
	directory="$(cat .pwd)"
	total=$(echo -e "$directory" |grep -o / |wc -l)
	let total+=1
	name=$(echo -e "$directory" |awk -F "/" "{print \$$total}")
	directory_name="$name"
fi
close() {
tool_name=$(sed -n $secim\p tools.txt)
if [[ -a $HOME/$tool_name ]];then
	cd $HOME/$tool_name
	script_name=$(ls |grep .sh |sed -n 1p)
	bash $script_name
	exit
fi
}
printf "\e[32m[✓]\e[92m $(sed -n $secim\p tools.txt) \e[0m $directory_name DİZİNİNE İNDİRİLİYOR "
echo
echo
echo
git clone https://github.com/termuxxtoolss/$(sed -n $secim\p tools.txt)
mv $(sed -n $secim\p tools.txt) $directory
rm tool.txt tools.txt tool.txte

