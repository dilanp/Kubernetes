#Set Alias: PowerShell
Set-Alias –Name k –Value kubectl
#Set Alias: Mac/Linux
alias k="kubectl"

#Get all stuff on a cluster.
kubectl get all

#Formatting object information differently.
kubectl get pod pod-name -o wide
kubectl get pod pod-name -o yaml
kubectl get pod pod-name -o json