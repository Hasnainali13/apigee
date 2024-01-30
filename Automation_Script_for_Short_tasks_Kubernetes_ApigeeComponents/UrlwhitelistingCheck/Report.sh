#!/bin/sh
pd=`pwd`
cd $pd/Logs

if [ $1 == "S" ]
then
  fnames=`ls *S*`
  echo $fnames
  cnt=`ls *S*|wc -l`
   elif [ $1 == "F" ]
then
fnames=`ls *F*`
cnt=`ls *F*|wc -l`
else
fnames=`ls *`
cnt=`ls *|wc -l`
fi
#sleep 10
if [ $cnt -lt 1 -a $1 == "S" ] 
then
echo " Succcess Reports are not available "
elif [ $cnt -lt 1 -a $1 == "F" ] 
then
echo " Failure Reports are not available "
elif [ $cnt -lt 1 -a $1 == "A" ] 
then
echo " Reports are not available "
else
for eachfile in $fnames
do
   #echo $eachfile
   cat $eachfile
done
fi
cd $pd
sh Report_Main.sh