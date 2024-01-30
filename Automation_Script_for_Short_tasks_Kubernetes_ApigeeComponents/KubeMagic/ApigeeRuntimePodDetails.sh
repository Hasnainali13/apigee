
#!/bin/bash

RED="\e[1;31m"
ENDCOLOR="\e[0m"
BLUE="\e[1;34m"
MAG="\e[1;35m"
GREEN="\e[0;32m"

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Apigee-Runtime POD Basic Details ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee 

echo -e "                        "

kubectl get po -l="app=apigee-runtime" -n apigee  -o=custom-columns=NAME:{.metadata.name},ENV:{.metadata.labels.env},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP}

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Apigee-Runtime Image & Resource Details ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.metadata.labels.env},IMAZE:{.status.containerStatuses[0].image},CPU:{.spec.containers[0].resources.requests.cpu},MEMORY:{.spec.containers[0].resources.requests.memory},PORTS:{.spec.containers[0].ports[*].containerPort}


echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                    Apigee-Runtime READYNESS PROBE Details ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.metadata.labels.env},PATH:{.spec.containers[0].readinessProbe.httpGet.path},PATH:{.spec.containers[0].readinessProbe.httpGet.port},initialDelaySeconds:{.spec.containers[0].readinessProbe.initialDelaySeconds},periodSeconds:{.spec.containers[0].readinessProbe.periodSeconds},successThreshold:{.spec.containers[0].readinessProbe.successThreshold},failureThreshold:{.spec.containers[0].readinessProbe.failureThreshold},timeoutSeconds:{.spec.containers[0].readinessProbe.timeoutSeconds}

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Apigee-Runtime LIVENESS PROBE Details ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.metadata.labels.env},PATH:{.spec.containers[0].livenessProbe.httpGet.path},PATH:{.spec.containers[0].livenessProbe.httpGet.port},initialDelaySeconds:{.spec.containers[0].livenessProbe.initialDelaySeconds},periodSeconds:{.spec.containers[0].livenessProbe.periodSeconds},successThreshold:{.spec.containers[0].livenessProbe.successThreshold},failureThreshold:{.spec.containers[0].livenessProbe.failureThreshold},timeoutSeconds:{.spec.containers[0].livenessProbe.timeoutSeconds}

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Apigee-Runtime Init Container  Details ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},IMAZE:{.spec.initContainers[0].image}

echo -e "                                 "

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},ORG:{.spec.initContainers[0].env[0].value},DATACENTER:{.spec.initContainers[0].env[1].value},REPL_FACTOR:{.spec.initContainers[0].env[2].value},SERVICE_TYPE:{.spec.initContainers[0].env[3].value},CASS_HOST:{.spec.initContainers[0].env[6].value},SSL_ENABLED:{.spec.initContainers[0].env[5].value},CREDENTIALS:{.spec.initContainers[0].env[7].valueFrom.secretKeyRef.name}

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Apigee-Runtime Container ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"

kubectl get po -l="app=apigee-runtime" -n apigee -o=custom-columns=NAME:{.spec.containers[0].name},ORG:{.spec.containers[0].env[3].value},REGION:{.spec.containers[0].env[5].value},IMAZE:{.spec.containers[0].image}
sh ./Main.sh



