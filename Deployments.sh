#Create a deployment imperatively.
kubectl create deployment my-first-deploy --image=stacksimplify/kubenginx:1.0.0

#Create a service for a deployment imperatively.
kubectl expose deploy my-first-deploy --type=LoadBalancer --port=80 --target-port=80 --name=my-first-deploy-svc

#Push the deployment.
kubectl apply -f deploy.yml
#Push multiple YAML files.
kubectl apply -f 03-frontend-deployment.yml -f 04-frontend-LoadBalancer-service.yml
#Push multiple YAML files in a folder
kubectl delete -f kube-manifests/

#Check the deployment details.
kubectl get deploy

#Get details of replica sets available.
kubectl get rs

#Get endpoints of a load balanced service.
kubectl describe ep ps-lb

#Horizontally scale pods in a deployment.
kubectl scale deploy dep-name --replicas=5
kubectl scale -f deployment.yml --replicas=5
kubectl scale deployment/my-first-deploy --replicas=10

#Upgrade image used in the pods of a deployment imperatively using "set deployment".
#To get the container-name run the deployment get command in yaml output formatting
#and, inspect the following path => spec/spec/containers/name
#kubectl get deploy my-first-deploy -o yaml
kubectl set image deployment/deployment-name container-name=stacksimplify/kubenginx:2.0.0 --record=true

#Upgrade image used in the pods of a deployment imperatively using "edit deployment".
kubectl edit deployment/my-first-deploy
#Next in vi press 'i' to enter edit mode and change => spec/spec/containers/image
#Press ESC to leave edit mode and type ::wq to exit vi.

#Roll out an orderly update.
#First, setup rollout strategy like in deploy-rolling-update.yml
#Then push the deployment
kubectl apply -f deploy-rolling-update.yml

#Add a pods watch to monitor how rollout is going...
kubectl get pods --watch

#Roll out the web-deploy deployment specified in YAML.
kubectl rollout status deploy web-deploy
kubectl rollout status deployment/my-first-deploy

#Check the deployment revisions.
kubectl rollout history deploy web-deploy
kubectl rollout history deployment/my-first-deploy

#Get information about a specific revision.
kubectl rollout history deployment/my-first-deploy --revision=1

#Roll back the deployment to the previous revision.
kubectl rollout undo deployment/my-first-deploy

#Roll back the deployment to the required revision.
kubectl rollout undo deployment/my-first-deploy  --to-revision=1
kubectl rollout undo deploy web-deploy --to-revision=1

#Restart the pods in a deployment in a rolling fashion.
kubectl rollout restart deployment/my-first-deploy

#Deploy multiple changes at once by pausing/resuming deployments.
#First pause the deployment.
kubectl rollout pause deployment/my-first-deploy
#Do the change 1.
kubectl set image deployment/my-first-deploy kubenginx=stacksimplify/kubenginx:4.0.0 --record=true
#Do the change 2.
kubectl set resources deployment/my-first-deploy -c=kubenginx --limits=cpu=20m,memory=30Mi
#Do the change 3,4...n
#Finally, resume the deployment.
kubectl rollout resume deployment/my-first-deploy
