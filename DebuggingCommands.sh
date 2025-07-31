kubectl describe <resource_type> <resource_name> -n <namespace>
#<resource_type>: e.g., pod, deployment, service, node, etc.
#<resource_name>: the specific name of the resource.
#-n <namespace>: optional, specifies the namespace (default is default).
# kubectl describe is a powerful Kubernetes CLI command that provides detailed information about a specific Kubernetes resource. It goes beyond kubectl get by offering a deep dive into the current state, events, conditions, and configurations of a resource.
#-------------------------------------------------------------------------------------------------------#--------------------------------------------------
kubectl get events
#This lists cluster events such as pod creation, failures, scheduling issues, container restarts, etc.
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
kubectl get pods --show-labels
#used to list all the pods in your Kubernetes cluster along with their associated labels. Labels are key-value pairs attached to objects like pods, which help in organizing and selecting subsets of objects.
#
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
kubectl rollout status deployment my-app
kubectl get pods -l app=my-app
#To Watch a Rolling Update
#-------------------------------------------------------------------------------------------------------------------------------------------------












