#!/bin/bash
kubectl get no
kubectl get node -o=custom-columns=NODE:{.metadata.name},IP:{.status.addresses[0].address},STATUS:{.status.conditions[-1].type},kEndpoint:{.status.daemonEndpoints.kubeletEndpoint.Port},CPU:{.status.capacity.cpu},ephemeral-storage:{.status.capacity.ephemeral-storage},memory:{.status.capacity.memory},Pods:{.status.capacity.pods}
