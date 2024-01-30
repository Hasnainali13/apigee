
#!/bin/bash

echo "**************************************************************************************************"
echo "                     Apigee-Ingress-GateWay POD Basic Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-ingressgateway" -n apigee 

kubectl get po -l="app=apigee-ingressgateway" -n apigee  -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STTIME:{.status.startTime}

echo "**************************************************************************************************"
echo "                     Apigee-Ingress-GateWay Image & Resource Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-ingressgateway" -n apigee -o=custom-columns=NAME:{.metadata.labels.ingress_name},IMAZE:{.status.containerStatuses[0].image},CPU:{.spec.containers[0].resources.requests.cpu},MEMORY:{.spec.containers[0].resources.requests.memory}

echo "**************************************************************************************************"
echo "                     Apigee-Ingress-GateWay ENV Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-ingressgateway" -n apigee -o=custom-columns=NAME:{.metadata.labels.ingress_name},JWT_POLICY:{.spec.containers[0].env[6].value},PORTS:{.spec.containers[0].ports[*].containerPort}


echo "**************************************************************************************************"
echo "                     Apigee-Ingress-GateWay READYNESS PROBE Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-ingressgateway" -n apigee -o=custom-columns=NAME:{.metadata.labels.ingress_name},PATH:{.spec.containers[0].readinessProbe.httpGet.path},PATH:{.spec.containers[0].readinessProbe.httpGet.port},initialDelaySeconds:{.spec.containers[0].readinessProbe.initialDelaySeconds},periodSeconds:{.spec.containers[0].readinessProbe.periodSeconds},successThreshold:{.spec.containers[0].readinessProbe.successThreshold},failureThreshold:{.spec.containers[0].readinessProbe.failureThreshold},timeoutSeconds:{.spec.containers[0].readinessProbe.timeoutSeconds}

echo "**************************************************************************************************"
echo "                     Apigee-Ingress-GateWay RESOURCE  Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-ingressgateway" -n apigee -o=custom-columns=NAME:{.metadata.labels.ingress_name},Requested_CPU:{.spec.containers[0].resources.requests.cpu},Requested_Memory:{.spec.containers[0].resources.requests.memory},Limits_CPU:{.spec.containers[0].resources.limits.cpu},Limites_Memory:{.spec.containers[0].resources.limits.memory}
