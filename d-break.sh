# Counting down time with some text from Dominik Węglarz
# I deliver courses from Poland so :
# ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

function seconds-display()
{
  date=$((`date +%s` + $1));
  while [ "$date" -ne `date +%s` ]; do
    echo -ne "    Time left:  $(date -u --date @$(($date - `date +%s`)) +%H:%M:%S)\r";
    sleep 1
  done
}

function minutes-display()
{
  echo " "
  echo -ne "Break time was set for $1 minutes - until "
  date -d "$1 minutes" +"%H:%M" 
  echo " "
  seconds-display $1*60
  echo "Time is up. Get ready for next course content ... "
}

figlet Break  until  $(date -d "$1 minutes" +"%H:%M")
# date -d "$1 minutes" +"%H:%M" | figlet


minutes-display $1