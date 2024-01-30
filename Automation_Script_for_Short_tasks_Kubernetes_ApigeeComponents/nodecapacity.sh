#!/bin/bash
kubectl get no
kubectl get node -o=custom-columns=NODE:{.metadata.name},IP:{.status.addresses[0].address},STATUS:{.status.conditions[-1].type},kEndpoint:{.status.daemonEndpoints.kubeletEndpoint.Port},CPU:{.status.capacity.cpu},ephemeral-storage:{.status.capacity.ephemeral-storage},memory:{.status.capacity.memory},Pods:{.status.capacity.pods}

kubectl get node -o custom-columns=NAME:.metadata.name,IP:{.status.addresses[0].address},"Region":".metadata.labels.topology\.kubernetes\.io/region","Zone":".metadata.labels.topology\.kubernetes\.io/zone","Mode":".metadata.labels.kubernetes\.azure\.com/mode","NodePool":".metadata.labels.cloud\.google\.com/gke-nodepool","AgentPool":".metadata.labels.kubernetes\.azure\.com/agentpool","StorageTier:.metadata.labels.storagetier"
