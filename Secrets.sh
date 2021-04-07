#Create a secret and store securely in Kubernetes
kubectl create secret generic my-secret --from-literal=pwd=my-password
#Create a secret from a file
kubectl create secret generic my-secret --from-file=ssh-privatekey=~/.ssh/id_rsa --from-file=ssh-publickey=~/.ssh/id_rsa.pub
#Create a secret from a key pair
kubectl create secret tls tls-secret --cert=path/to/tls.cert --key=path/to/tls.key

#Get secrets
kubectl get secrets

#Get YAML for specific secret
kubectl get secrets db-passwords –o yaml