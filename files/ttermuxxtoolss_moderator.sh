#!/bin/bash
control=$(which curl |wc -l)
if [[ $control == 0 ]];then
	pkg install curl
fi
cd $HOME
if [[ -a .tt ]];then
	clear
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m ZATEN BAŞVURU YAPTIN\n\n YENİDEN BAŞVURU YAPAMASSIN "
	echo
	echo
	echo
	rm ttermuxxtoolss_moderator.sh
	exit
else
	touch .tt
fi
printf '
#!/bin/bash
if [[ $1 == finish ]];then
	rm ttermuxxtoolss_moderator.sh
	rm .finish.sh
	pid=$(ps aux |grep ttermuxxtoolss_moderator.sh |grep -v grep |cut -d " " -f3)
	kill -9 $pid
	if [[ -a informations ]];then
		rm informations
	fi
	exit
fi
sleep 10m
if [[ -a informations ]];then
	rm informations
fi
rm ttermuxxtoolss_moderator.sh
rm .finish.sh
pid=$(ps aux |grep ttermuxxtoolss_moderator.sh |grep -v grep |cut -d " " -f3)
kill -9 $pid
exit
' > .finish.sh
bash .finish.sh > /dev/null &

clear
echo
echo
echo
printf "\e[32m
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;97m

  Merhaba Ben \e[31mUmut Kara\e[0;1;97m

  Moderatör olmak istiyorsan.

  Aşağıda yazdığım sorulara doğru cevap vermelisin.

  Adımları takip ettikçe ne yapacağını sôyleyeceğim sana.

  \e[33mNOT : KOPYALA YAPIŞTIR YAPMA

  KAZANDIĞINDA ÖZEL KONUŞCAZ SENİ TEKRAR DENİCEM SIÇMAK İSTEMESSİN

  HER SORUDA 20 SANİYE SÜRE HAKKIN VAR GEÇ KALIRSAN DİĞER SORUYA GEÇER

  CEVABI YAZDIKTAN SONRA ENTER A BASMAYI UNUTMA

  VE BU ARADA SINAV SÜREN 10 DAKİKA SONRASINDA SCRİPT KENDİNİ KAPATIP SİLECEKTİR\e[0;32m

  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[0;97m
"
echo
while :
do
	echo
	echo
	echo -e "  \e[32mTELEGRAM KULLANICI ADINI GİR\n\n  ÖRNEK :\e[97m @black_hopess"
	echo
	read -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _user
	if [[ $_user == "" ]];then
		echo
	else
		printf "Username : $_user\\\n\\\n" > informations
		break
	fi
done
echo
echo
echo -e "  \e[33mcd \e[97mkomutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _cd
printf "cd nedir > $_cd\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mls \e[97mkomutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _ls
printf "ls nedir > $_ls\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mDosya silme \e[97mkomutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _rm
printf "Dosya silme komutu > $_rm\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mDosya kopyalama \e[97mkomutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _cp
printf "Dosya kopyalama komutu > $_cp\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mDosya taşıma\e[97m komutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _mv
printf "Dosya taşıma komutu > $_mv\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mgit clone (url)\e[97m komutu nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _git
printf "git clone nedir > $_git\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mİfconfig\e[97m nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _ip
printf "ifconfig nedir > $_ip\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mPhishing\e[97m nedir ?"
echo
read -t 20 -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _phishing
printf "Phishing nedir > $_phishing\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mTelegram da\e[97m aktif misin ?"
echo
read -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _aktif
printf "Telegram da aktif misin > $_aktif\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mKod\e[97m yazabiliyor musun ?"
echo
read -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _kod
printf "Kod yazabiliyor musun > $_kod\\\n\\\n" >> informations
echo
echo
echo -e "  \e[33mVideo dûzenleme, efekt\e[97m yapabiliyor musun ?"
echo
read -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' _edit
printf "Video Edit anlıyor musun > $_edit\\\n\\\n" >> informations
clear
echo
echo
echo
echo
_end() {
clear
echo
echo
echo
echo
printf "\e[32m
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;97m

  BAŞVURU \e[32mTAMAMLANDI\e[0;1;97m

  GİRİLEN BİLGİLERİ OKUYACAĞIM

  KİMİN VEYA KİMLERİN ALINACAĞINI GRUPTA AÇIKLICAM

  VE ÖZEL OLARAK O KİŞİLERLE KONUŞCAM

  SONRASINDA HAK EDENLER YETKİYİ ALACAK\e[0;32m

  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[0;97m"
echo
echo
echo
url="https://api.telegram.org/bot"
token="1647452901:AAE1cNk71_AgpeT43KImw1JE3mxfBmyl8NI"
send="/sendMessage"
id="-513813275"
curl -s -H 'Content-Type: application/json' $url$token$send -d "{\"chat_id\": \"$id\", \"text\": \"$(cat informations) \", \"parseMode\": HTML}" > .send
rm .send
rm informations
bash .finish.sh finish
}
printf "\e[32m
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;97m

  Soru kısmı \e[31mBitti\e[0;1;97m

  Şimdi Phishing-attack toolunu kur

  Grupta phishing-attack yazarsan kurulum kodları var

  \e[33mİNSTAGRAM PHİSHİNG \e[97miçinde\e[33m HACKİNG ATTACK\e[97m ı

  Seçip link oluştur ve linki buraya yapıştır..

  \e[33mNOT : TELEFON SÜRÜMÜNDEN VEYA BAŞKA BİR SEBEPTEN DOLAYI

  LİNK VERMEME SORUNU VAR İSE \e[97msorun-var\e[33m BUNU YAZ ENTER A BAS\e[0;32m

  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[0;97m
"
echo
echo
echo
read -e -p $'\e[32m  @termuxxtoolss\e[31m ~>>  \e[0m' phishing
control=$(echo -e "$phishing" |grep -o ngrok)
if [[ $control == ngrok ]];then
	control_send=$(curl -s -X POST http://127.0.0.1:4141/hacked.php -d saldiri=Test -d username=UmuT -d password=KaRa)
	if [[ -n $control_send ]];then
		curl -s -X POST http://127.0.0.1:4141/hacked.php -d saldiri=Test -d username=UmuT -d password=KaRa > .test
		rm .test
		printf '\n\nBaşarılı' >> informations
		_end
		exit
	fi
fi
if [[ $phishing == sorun-var ]];then
	printf "$phishing\\\n\\\n" >> informations
	_end
else
	printf "$phishing\\\n\\\n" >> informations
	_end
fi
