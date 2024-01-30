#!/bin/sh
echo "#####################################################"
echo " 1 - Success_Report"
echo " 2 - Failure_Report"
echo " 3 - Both"
echo " 4 - Main Menu"
echo "#####################################################"
echo " Please choose your option from Above:\c"
read opt
case $opt in
1) sh Report.sh S
;;
2)sh Report.sh F
;;
3)sh Report.sh A
;;
4)sh Main.sh 
;;
esac
   
