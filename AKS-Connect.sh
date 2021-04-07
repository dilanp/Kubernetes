#First login to Azure subscription.
az login

#These commands are available under "Connect" option of K8s cluster...
#Set the subscription if you have multiple.
az account set --subscription c4c918d8-48c0-485f-8960-05d7cabfee6b

#Set AKS cluster info into local Kubernetes config.
az aks get-credentials --resource-group K8s --name ps-gsk
