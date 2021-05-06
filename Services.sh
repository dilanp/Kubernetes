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

#Create a service imperatively.
#If the port and target-port are both the same then --target-port parameter is not required.
#If --type parameter is not specified then it is defaulted to 'ClusterIp'.
kubectl expose pod my-first-pod --type=LoadBalancer --port=80 --name=my-first-service

#Create a 'load balanced' service for a replicaset.
kubectl expose rs my-helloworld-rs --type=LoadBalancer --port=80 --target-port=8080 --name=my-helloworld-rs-service

#Get details of a service.
kubectl get svc ps-nodeport

#Describe the service details.
kubectl describe svc ps-nodeport

