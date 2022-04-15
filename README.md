# Install KIND (Kubernetes in Docker)
1. Install Docker Desktop
2. Install brew (if you don't have it already)
3. ```brew install kind```
4. ```kind create cluster```

To check you did this right, run:
```
kubectl get all --all-namespaces
```

# M1 Install Process
1. Install Multipass: https://multipass.run/docs/installing-on-macos
2. Create a multipass VM: ```multipass launch --name mysql --mem 4G --disk 15G --cpus 2 impish```
3. Login to the VM: ```multipass shell mysql```
4. Update Ubuntu: 
```
sudo apt update
sudo apt upgrade
```
5. Install Docker:
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
6. Clone Kind: 
```
git clone https://github.com/kubernetes-sigs/kind.git
sudo apt install make
cd kind
make install
/home/ubuntu/go/bin/kind create cluster
```
