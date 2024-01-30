#!/bin/bash
echo "**************************************************************************************************"
echo "                     Node Status & Age "
echo "**************************************************************************************************"
kubectl get no
echo "**************************************************************************************************"
echo "                     Node Basic Detasil "
echo "**************************************************************************************************"
kubectl get node -o=custom-columns=NODE:{.metadata.name},IP:{.status.addresses[0].address},"Region":".metadata.labels.topology\.kubernetes\.io/region","Zone":".metadata.labels.topology\.kubernetes\.io/zone",CPU:{.status.capacity.cpu},ephemeral-storage:{.status.capacity.ephemeral-storage},memory:{.status.capacity.memory},Pods:{.status.capacity.pods}
echo "**************************************************************************************************"
echo "                 Cluster Details  "
echo "**************************************************************************************************"
kubectl get node -o custom-columns=IP:{.status.addresses[0].address},"Mode":".metadata.labels.kubernetes\.azure\.com/mode","NodePool":".metadata.labels.cloud\.google\.com/gke-nodepool","AgentPool":".metadata.labels.kubernetes\.azure\.com/agentpool","StorageTier:.metadata.labels.storagetier","Cluster":".metadata.labels.kubernetes\.azure\.com/cluster"

