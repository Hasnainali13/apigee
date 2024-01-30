#!/bin/bash

echo "**************************************************************************************************"
echo "                     Apigee-connect-agent POD Basic Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-connect-agent" -n apigee 

kubectl get po -l="app=apigee-connect-agent" -n apigee  -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STTIME:{.status.startTime}

echo "**************************************************************************************************"
echo "                     Apigee-connect-agent Image & Resource Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-connect-agent" -n apigee -o=custom-columns=IMAZE:{.status.containerStatuses[0].image},CPU:{.spec.containers[0].resources.requests.cpu},MEMORY:{.spec.containers[0].resources.requests.memory}

echo "**************************************************************************************************"
echo "                     Apigee-connect-agent ENV Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-connect-agent" -n apigee -o=custom-columns=CLUSTER_NAME:{.spec.containers[0].env[7].value},REGION:{.spec.containers[0].env[6].value},SERVER_ADDR:{.spec.containers[0].env[2].value},TARGET_SERVER:{.spec.containers[0].env[5].value}
