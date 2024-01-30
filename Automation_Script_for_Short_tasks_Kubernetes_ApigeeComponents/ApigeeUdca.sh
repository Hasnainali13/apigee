
#!/bin/bash

echo "**************************************************************************************************"
echo "                     Apigee-udca POD Basic Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-udca" -n apigee 

echo "                        "

kubectl get po -l="app=apigee-udca" -n apigee  -o=custom-columns=NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP}

echo "**************************************************************************************************"
echo "                     Apigee-udca Image & Resource Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-udca" -n apigee -o=custom-columns=NAME:{.status.containerStatuses[0].name},IMAZE:{.status.containerStatuses[0].image},CPU:{.spec.containers[0].resources.requests.cpu},MEMORY:{.spec.containers[0].resources.requests.memory},PORTS:{.spec.containers[0].ports[*].containerPort}


echo "**************************************************************************************************"
echo "                     Apigee-udca LIVENESS PROBE Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-udca" -n apigee -o=custom-columns=PATH:{.spec.containers[1].livenessProbe.httpGet.path},PORT:{.spec.containers[1].livenessProbe.httpGet.port},initialDelaySeconds:{.spec.containers[1].livenessProbe.initialDelaySeconds},periodSeconds:{.spec.containers[1].livenessProbe.periodSeconds},successThreshold:{.spec.containers[1].livenessProbe.successThreshold},failureThreshold:{.spec.containers[1].livenessProbe.failureThreshold},timeoutSeconds:{.spec.containers[1].livenessProbe.timeoutSeconds}

echo "**************************************************************************************************"
echo "                     Apigee-udca Init Container  Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-udca" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},IMAZE:{.spec.initContainers[0].image}




