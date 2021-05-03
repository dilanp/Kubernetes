#IMPERATIVE CREATION.
#=====================
#Expose the pod and specify Node Port to add a port to all nodes on the cluster.
kubectl expose pod hello-pod --name=hello-svc --target-port=8080 --type=NodePort

#Get newly created service details.
kubectl get svc
#This should show you the node port created for the service.
#Any websites should be accessed using a public IP of any node => Public_IP:NodePort

#Manually delete a service
kubectl delete svc hello-svc

#DECLARATIVE CREATION.
#======================
#Service using node port.
#In the yml, Node Port must be between 30000-32767.
kubectl apply -f svc-nodeport.yml
#Load balancer example...

#Get details of a service.
kubectl get svc ps-nodeport

#Describe the service details.
kubectl describe svc ps-nodeport

