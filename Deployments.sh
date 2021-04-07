#Push the deployment.
kubectl apply -f deploy.yml

#Check the deployment details.
kubectl get deploy

#Get details of replica sets available.
kubectl get rs

#Get endpoints of a load balanced service.
kubectl describe ep ps-lb

#Roll out an orderly update.
#First, setup rollout strategy like in deploy-rolling-update.yml
#Then push the deployment
kubectl apply -f deploy-rolling-update.yml

#Add a pods watch to monitor how rollout is going...
kubectl get pods --watch
#Roll out the web-deploy deployment specified in YAML.
kubectl rollout status deploy web-deploy

#Check the deployment revisions.
kubectl rollout history deploy web-deploy

#Roll back the deployment to the required revision.
kubectl rollout undo deploy web-deploy --to-revision=1