#The only way to create replicaset is the declarative way
kubectl apply -f replicaset-demo.yml

#Get replicasets.
kubectl get rs

#Describe a replicaset.
kubectl describe rs my-helloworld-rs

#Create a 'load balanced' service for a replicaset.
kubectl expose rs my-helloworld-rs --type=LoadBalancer --port=80 --target-port=8080 --name=my-helloworld-rs-service

