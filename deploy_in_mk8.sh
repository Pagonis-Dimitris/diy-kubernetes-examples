# # Download kubectl latest release
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# # Validate binary
# curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# echo "$(<kubectl.sha256) kubectl" | sha256sum --check

# # Install kubectl
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# # Test 
# kubectl version --client
# rm kubectl
# rm kubectl.sha256

sudo snap install microk8s --classic
microk8s status --wait-ready ##checks

microk8s kubectl get nodes


echo "alias mk8s='microk8s kubectl'" >> ~/.bash_aliases;
shopt -s expand_aliases
source ~/.bash_aliases
source ~/.bashrc


microk8s enable dns
microk8s enable hostpath-storage
microk8s enable rbac

mk8s apply -f microk8s/namespace.yaml
mk8s apply -f microk8s