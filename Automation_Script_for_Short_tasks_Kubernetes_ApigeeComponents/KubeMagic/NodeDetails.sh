#!/bin/bash

RED="\e[1;31m"
ENDCOLOR="\e[0m"
BLUE="\e[1;34m"
MAG="\e[1;35m"
GREEN="\e[0;32m"

echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                     Node Status & Age ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
kubectl get no
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                      Node Basic Detasil ${ENDCOLOR}"
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
kubectl get node -o=custom-columns=NODE:{.metadata.name},IP:{.status.addresses[0].address},"Region":".metadata.labels.topology\.kubernetes\.io/region","Zone":".metadata.labels.topology\.kubernetes\.io/zone",CPU:{.status.capacity.cpu},ephemeral-storage:{.status.capacity.ephemeral-storage},memory:{.status.capacity.memory},Pods:{.status.capacity.pods}
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
echo -e "${MAG}                  Cluster Details  "
echo -e "${GREEN}**************************************************************************************************${ENDCOLOR}"
kubectl get node -o custom-columns=IP:{.status.addresses[0].address},"Mode":".metadata.labels.kubernetes\.azure\.com/mode","NodePool":".metadata.labels.cloud\.google\.com/gke-nodepool","AgentPool":".metadata.labels.kubernetes\.azure\.com/agentpool","StorageTier:.metadata.labels.storagetier","Cluster":".metadata.labels.kubernetes\.azure\.com/cluster"
sh ./Main.sh

