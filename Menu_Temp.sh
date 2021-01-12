 Script Menu ..... Template

if [ "$#" -eq 0 ] ; 
then

  echo -e "Please select 1 - 3:"
  exit 1
elif [ "$#" -gt 1 ] ;
then

  echo -e "Please select 1 - 3:"
  exit 1
else
  numb=$1
  case "$numb" in
    1) echo "Install Basic Pimiga3000 ";;
    2) echo "Install Pimiga3000, Retropie & more";;
    3) echo "Install Pimiga3000, Retropie & OLED Display";;
    
    *) echo -e "Wrong input. Please write a number between 1 and 3.";;
  esac
fi
exit 2
exit 0