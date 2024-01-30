
#!/bin/bash

RED="\e[1;31m"
ENDCOLOR="\e[0m"
BLUE="\e[1;34m"
MAG="\e[1;35m"
GREEN="\e[0;32m"

echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                     Casandra POD Basic Details ${ENDCOLOR}"
echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"

kubectl get po -l="app=apigee-cassandra" -n apigee 

echo -e "                         "

kubectl get po -l="app=apigee-cassandra" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STATUS:{.status.phase},STTIME:{.status.startTime}



echo -e " ${GREEN}************************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                     Casandra POD Image Details ${ENDCOLOR}"
echo -e " ${GREEN}************************************************************************************************** ${ENDCOLOR}"

kubectl get po -l="app=apigee-cassandra" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},IMAZE:{.status.containerStatuses[0].image}

echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                     Casandra Schema POD Basic Details ${ENDCOLOR}"
echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee 

echo -e "                          "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STATUS:{.status.phase}

echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                     Casandra Schema Init Container  Details ${ENDCOLOR}"
echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},IMAZE:{.spec.initContainers[0].image}

echo -e "                                 "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},CASSANDRA_SEEDS:{.spec.initContainers[0].env[0].value},CREDENTIALS:{.spec.initContainers[0].env[1].valueFrom.secretKeyRef.name},volumeMounts:{.spec.initContainers[0].volumeMounts[0].mountPath}


echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"
echo -e "${MAG}                     Casandra Schema Container ${ENDCOLOR}"
echo -e "${GREEN}************************************************************************************************** ${ENDCOLOR}"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.containers[0].name},IMAZE:{.spec.containers[0].image}

echo -e "                            "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.containers[0].name},ORG:{.spec.containers[0].env[0].value},DATACENTER:{.spec.containers[0].env[1].value},REPL_FACTOR:{.spec.containers[0].env[2].value},SERVICE_TYPE:{.spec.containers[0].env[3].value},CASS_HOST:{.spec.containers[0].env[4].value},SSL_ENABLED:{.spec.containers[0].env[5].value},CREDENTIALS:{.spec.containers[0].env[6].valueFrom.secretKeyRef.name}

sh ./Main.sh

