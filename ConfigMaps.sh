#Create a config map from a ConfigMap manifest
 kubectl create -f file.configmap.yml

#Create a config map from an environment file.
#Will NOT add file name as key into ConfigMap data. 
#Will add quotes around non-string values.
kubectl create configmap app-settings --from-env-file=configMap-env-file.config
kubectl create cm app-settings --from-env-file=configMap-env-file.config

#Create a ConfigMap using data from a file. 
#Will add file name as key into ConfigMap data. 
#Will NOT add quotes around non-string values.
kubectl create cm app-settings --from-file=settings.properties

#Create a ConfigMap from individual data values.
#Will add quotes around non-string values.
kubectl create cm app-settings --from-literal=apiUrl=https://my-api --from-literal=otherKey=otherValue

#Get a ConfigMap.
kubectl get cm app-settings -o yaml

#Delete a ConfigMap.
kubectl delete cm app-settings