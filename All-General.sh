#Set Alias: PowerShell
Set-Alias –Name k –Value kubectl
#Set Alias: Mac/Linux
alias k="kubectl"

#See the documentation of capabilities for any K8s object.
kubectl explain pods
kubectl explain pods.spec
kubectl explain pods --recursive

#Get all stuff on a cluster.
kubectl get all

#Deploy all YAML files in a folder.
kubectl apply -f folder_name

#Edit any object's configuration.
kubectl edit sc standard
#To edit in Visual Studio code RUN...
export KUBE_EDITOR='code --wait'

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