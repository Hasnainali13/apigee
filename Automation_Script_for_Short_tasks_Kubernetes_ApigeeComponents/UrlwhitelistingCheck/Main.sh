#!/bin/sh
echo "#####################################################"
echo " 1 - UrlWhiteList Check "
echo " 2 - Reports"
echo " 3 - EXIT"
echo "#####################################################"
echo " Please choose your option from Above:\c"
read opt
case $opt in
1) sh Rcheck.sh UrlList
;;
2)sh Report_Main.sh
;;
3)exit 
;;
esac
   



   