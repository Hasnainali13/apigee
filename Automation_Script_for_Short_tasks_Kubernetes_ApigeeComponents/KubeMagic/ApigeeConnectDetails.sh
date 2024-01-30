#!/bin/bash
RED="\e[1;31m"
ENDCOLOR="\e[0m"
BLUE="\e[1;34m"
MAG="\e[1;35m"
GREEN="\e[0;32m"

echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e -e "${MAG}                     Apigee-connect-agent POD Basic Details ${ENDCOLOR}"
echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-connect-agent" -n apigee 

kubectl get po -l="app=apigee-connect-agent" -n apigee  -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STTIME:{.status.startTime}

echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e -e "${MAG}                     Apigee-connect-agent Image & Resource Details ${ENDCOLOR}"
echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-connect-agent" -n apigee -o=custom-columns=IMAZE:{.status.containerStatuses[0].image},CPU:{.spec.containers[0].resources.requests.cpu},MEMORY:{.spec.containers[0].resources.requests.memory}

echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e -e "${MAG}                     Apigee-connect-agent ENV Details ${ENDCOLOR}"
echo -e -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-connect-agent" -n apigee -o=custom-columns=CLUSTER_NAME:{.spec.containers[0].env[7].value},REGION:{.spec.containers[0].env[6].value},SERVER_ADDR:{.spec.containers[0].env[2].value},TARGET_SERVER:{.spec.containers[0].env[5].value}
sh ./Main.sh