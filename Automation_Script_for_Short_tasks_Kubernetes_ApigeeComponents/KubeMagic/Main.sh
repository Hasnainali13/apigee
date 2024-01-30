#!/bin/sh

RED="\e[1;31m"
ENDCOLOR="\e[0m"
BLUE="\e[1;34m"
MAG="\e[1;35m"
GREEN="\e[0;32m"
echo -e "${GREEN}***************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                                        MAIN PAGE                                         ${ENDCOLOR}"
echo -e "${GREEN}*****************************************************************************************"
echo -e " 1 - NODE DETAILS"
echo -e " 2 - RUNTIME PODS"
echo -e " 3 - INGRESS GATEWAY PODS"
echo -e " 4 - APIGEE CONNECT PODS"
echo -e " 5 - CASANDRA PODS"
echo -e " 6 - SYNCHRONIZER PODS"
echo -e " 7 - UDCA PODS"
echo -e " 8 - WATCHER PODS"
echo -e " 9 - SERVICE DETAILS"
echo -e " 10 - EXIT "
echo -e "****************************************************************************************** ${ENDCOLOR}"
echo -e "${RED}Please choose your option from Above: ${ENDCOLOR}"
read -e opt
case $opt in
1)sh ./NodeDetails.sh
;;
2)sh ./ApigeeRuntimePodDetails.sh
;;
3) sh ./IngressGateWayDetails.sh
;;
4) sh ./ApigeeConnectDetails.sh
;;
5) sh ./CasandraPodDetails.sh
;;
6) sh ./ApigeeSynchronizer.sh
;;
7) sh ./ApigeeUdca.sh
;;
8) exit
;;
9)exit 
;;
10)exit 
;;
esac

