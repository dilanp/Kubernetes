#Set Alias: PowerShell
Set-Alias –Name k –Value kubectl
#Set Alias: Mac/Linux
alias k="kubectl"

#Get all stuff on a cluster.
kubectl get all

#If you are using "create" instead of "apply" then always use  --save-config switch 
#to add annotations into the metadata section.
kubectl create -f nginx.pod.yml --save-config
#Then check deployment annotations into the metadata section of yml.
kubectl get pod my-nginx -o yaml

#Get detailed info about anything.
kubectl describe pod hello-pod

#Get labels.
kubectl get pods --show-labels
kubectl get deploy --show-labels

#Get any object by matching labels.
kubectl get deploy -l app=nginx

#Formatting object information differently.
kubectl get pod pod-name -o wide
kubectl get pod pod-name -o yaml
kubectl get pod pod-name -o json