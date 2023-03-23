snap install microk8s --classic && microk8s enable dns && microk8s enable rbac

cd microk8s
microk8s kubectl apply -f namespace.yaml
cd ..
microk8s kubectl apply -f microk8s