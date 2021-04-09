#Aure static Persistent Volume (PV) provisioning
#===============================================
# 1 - Connect to Azure account and create K8s cluster (if not already there).
# 2 - Create the storage account and file share  (if not already there).
# Storage account must be in the same resourec group as K8s cluster.
# 3 - Copy the storage account key (key 1 usually).

# 4 - Create a secret on K8s cluster. This SECRET_NAME must go in the PV YAML. 
kubectl create secret generic SECRET_NAME \
    --from-literal=azurestorageaccountname=$AKS_PERS_STORAGE_ACCOUNT_NAME \
    --from-literal=azurestorageaccountkey=$STORAGE_KEY

# 5 - Deploy the PV.
kubectl apply -f volume-static-azure-fileshare-pv.yml
# The status of the PV should be "Available".
kubectl get pv ps-pv

# 6 - Deploy the Persistent Volume Claim (PVC)
kubectl apply -f volume-static-azure-fileshare-pvc.yml
# The PVC status should now be "Bound" to the volume "ps-pv".
kubectl get pvc ps-pvc
# Now, the status of the PV should also be "Bound"!!!
kubectl get pv ps-pv

# 7 - Finally, deploy the Deployment/Pod using the volume claim.
kubectl apply -f pod-pv-static-azure-fileshare-usage.yml

#Optional - Get details about the storage classes created in the process.
kubectl get sc


#Aure dynamic Persistent Volume (PV) provisioning
#=================================================
# 1 - Draft and deploy the StorageClass (SC) YAML.
kubectl apply -f volume-dynamic-storage-class.yml
# Make sure the SC is created.
kubectl get sc

# 7 - Edit the default SC and your SC and make the default SC is your one.
kubectl edit sc default
#To edit in Visual Studio code RUN...
export KUBE_EDITOR='code --wait'

#Its better if no other PVs are available (for inspecting purposes only).
kubectl get pv

# 8 - Create the Persistent Volume Claim (PVC) that links to the SC.
kubectl apply -f volume-dynamic-pvc.yml
# Notice the new PVC status is "Pending".
kubectl get pvc

# 9 - Create the Pod (or Deployment) that mounts a new volume using the PVC.
kubectl apply -f pod-pv-dynamic-azure-fileshare-usage.yml
#Make sure the pod has been created and running now!
#Notice the PVC status is now "Bound"! Beacuse as the SC has => volumeBindingMode: WaitForFirstConsumer.
kubectl get pvc

#A new PV should be now created with the status "Bound"!
kubectl get pv

# Optional - Created a service to access/load balance pods.
kubectl apply -f svc-lb.yml

# You should also notice in Azure that a new Storage Account is created.
# Also, a new file share is created and any content added by pod containers should be available there too...

#If the SC ReclaimPolicy is Delete (default) then, deleting the PVC will delete PV and file share on Azure.
# So, ReclaimPolicy Delete means: Deleting PVC => Deleted PV