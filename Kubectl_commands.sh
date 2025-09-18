#Cordon (disable scheduling):
kubectl cordon <node-name>

----------------------------------------
#Drain (cordon + evict pods safely):
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data

--------------------------------------------------
# Uncordon
kubectl uncordon <node-name>

------------------------------------------------
#Full cleanup of everything (except system components):
kubectl delete all --all --all-namespaces
kubectl delete statefulset --all --all-namespaces
kubectl delete pvc --all --all-namespaces
kubectl delete pv --all

--------------------------------------------------------
# Command to directl contact API server:
#This will print nodes of cluster

curl --cacert /etc/kubernetes/pki/ca.crt --cert /etc/kubernetes/pki/apiserver-kubelet-client.crt --key /etc/kubernetes/pki/apiserver-kubelet-client.key https://10.0.2.142:6443/api/v1/nodes | jq -r '.items[] | "\(.metadata.name) \(.status.conditions[] | select(.type=="Ready").status)"'
-----------------------------------------------------------------