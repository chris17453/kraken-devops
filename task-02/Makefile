



# install minikube for local kube cluster
install-minikube:
 curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
 sudo install minikube-linux-amd64 /usr/local/bin/minikube

 
# install host kube utilities
install-kube-client:
 dnf install 'kubernetes-client' -y


# launch kuberneties dashboard
install-dashboard:
	minikube dashboard
	minikube docker-env; \
	eval $(minikube -p minikube docker-env)


 # install minikube and host client utilities for interaction
 install: install-minikube install-kube-client install-dashboard



