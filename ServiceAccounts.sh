#Every resource we deploy must have a service account associated.
#If not specified then, K8s assigns it to the default service account in default namespace.
#There's a service account controller running in the cluster to make sure this is taken care of.
#You can see this the assigned service account if you inspect the detailed YAML of the resource.
kubectl get pod -o yaml

#Get service accounts and their details.
kubectl get sa
kubectl describe sa default
#This will reveal the "uid" of the identity this service account bound to.
#It should also show its token name that it uses to AuthN/AuthZ itself with the api server.
#That token is a secret in K8s so, you can describe that too...
kubectl describe secret default-token-x2tvd

#If you bash into the terminal of any pod running then,
#the following location has the assigned certificate of the pod.
/var/run/secrets/kubernetes.io/serviceaccount

#=====================================
#Perform a custom service account test
#Create the role based access control YAML and deploy it.
kubectl apply -f rbac.yml
#Check the Role we just created.
kubectl describe role svc-ro

#Create the service account for the RoleBinding we created.
kubectl create sa service-reader

#Make sure a token is attched to it.
kubectl describe sa service-reader

#Deploy the testing pod (with ambassador container).
#This is assigned to the "service-reader" service account.
kubectl apply -f sa-demo.yml

#Enter the shell of the app container.
kubectl exec sa-demo -it sh

#Service list should be successful.
curl localhost:8001/api/v1/namespaces/default/services/
#Pod list should return a "Forbidden" error.
curl localhost:8001/api/v1/namespaces/default/services
