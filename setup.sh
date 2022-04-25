sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
git clone https://github.com/kubernetes-sigs/kind.git
sudo apt install make
cd kind
make install
sudo /home/ubuntu/go/bin/kind create cluster
sudo snap install kubectl --classic
sudo kubectl apply -f ./k8s-mysql-deploy.yaml
sudo kubectl get all --all-namespaces
sudo kubectl port-forward --address 0.0.0.0 service/mysql 3306:3306
