
#!/bin/bash

echo "**************************************************************************************************"
echo "                     Casandra POD Basic Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-cassandra" -n apigee 

echo "                         "

kubectl get po -l="app=apigee-cassandra" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STATUS:{.status.phase},STTIME:{.status.startTime}



echo "**************************************************************************************************"
echo "                     Casandra POD Image Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-cassandra" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},IMAZE:{.status.containerStatuses[0].image}

echo "**************************************************************************************************"
echo "                     Casandra Schema POD Basic Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee 

echo "                          "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.metadata.name},NodePool:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0]},Weight:{.spec.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight},HOSTIP:{.status.hostIP},PODIP:{.status.podIP},STATUS:{.status.phase}

echo "**************************************************************************************************"
echo "                     Casandra Schema Init Container  Details"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},IMAZE:{.spec.initContainers[0].image}

echo "                                 "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.initContainers[0].name},CASSANDRA_SEEDS:{.spec.initContainers[0].env[0].value},CREDENTIALS:{.spec.initContainers[0].env[1].valueFrom.secretKeyRef.name},volumeMounts:{.spec.initContainers[0].volumeMounts[0].mountPath}


echo "**************************************************************************************************"
echo "                     Casandra Schema Container"
echo "**************************************************************************************************"

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.containers[0].name},IMAZE:{.spec.containers[0].image}

echo "                            "

kubectl get po -l="app=apigee-cassandra-schema-setup" -n apigee -o=custom-columns=NAME:{.spec.containers[0].name},ORG:{.spec.containers[0].env[0].value},DATACENTER:{.spec.containers[0].env[1].value},REPL_FACTOR:{.spec.containers[0].env[2].value},SERVICE_TYPE:{.spec.containers[0].env[3].value},CASS_HOST:{.spec.containers[0].env[4].value},SSL_ENABLED:{.spec.containers[0].env[5].value},CREDENTIALS:{.spec.containers[0].env[6].valueFrom.secretKeyRef.name}



