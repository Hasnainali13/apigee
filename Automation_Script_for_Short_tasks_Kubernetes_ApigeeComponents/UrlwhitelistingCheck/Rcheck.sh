red=$'\e[1;31m'
grn=$'\e[1;32m'
end=$'\e[0m'
echo $1 " Checking Started "
server=`hostname`
pd=`pwd`
Px="http://10.202.1.68:80"
LogPath=$pd"/Logs"
if [ -d $LogPath ]
then
 echo "$LogPath folder Exist"
 else
 mkdir -p $LogPath
  echo "$LogPath folder created"
fi
#SIP=`hostname -i |awk '{print $1}'`
#echo $SIP
#echo "Hostname: " $server
Sfile=$LogPath"/"$1"_"$(hostname)"_Succees.log"
Ffile=$LogPath"/"$1"_"$(hostname)"_Failure.log"
if [ -f "$Sfile" ]
then
	rm -r $Sfile
fi
if [ -f "$Ffile" ]
then
	rm -r $Ffile
fi
for i in $(cat $1); do 

   IP=`echo $i|awk -F',' '{print $1}'`
    
   Port=`echo $i|awk -F',' '{print $2}'`
   
  Res=`curl -Is  $IP  -x $Px|head -n 1`
  
  SRes=$server","$IP"-------------------"${grn}$Res${end}
  echo $SRes >> $Sfile
   
  
   
  #if timeout 1s telnet -c $IP  $Port </dev/null 2>&1 | grep -q Escape; then
  #SRes=${grn}$server","$i",Connected"${end}
   #   echo $SRes >> $Sfile
  #else
  #SRes=${red}$server","$i",Failed"${end}
  #echo $SRes >>$Ffile
#fi
echo $SRes
done
sh Main.sh
