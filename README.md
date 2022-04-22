# Install VirtualBox
1. Download and install Virtual box.
2. Restart the mac holding down Command+R when the apple logo appears
3. Login to your account and open up the terminal.
4. Enable the following kernal extension provider (Oracle):
```
spctl kext-consent add VB5E2TV963
shutdown -r now
```
5. After restarting, open VirtualBox and create the Ubuntu VM (including attaching the Ubuntu Server iso for installation)
6. Install Ubuntu Server (default options)
7. Start the VM and agree to any requested permissions.
8. Continue from step 4 in the Multipass instructions.

# Install KIND (Kubernetes in Docker)
1. Install Docker Desktop
2. Install brew (if you don't have it already)
3. ```brew install kind```
4. ```kind create cluster```

To check you did this right, run:
```
kubectl get all --all-namespaces
```
5. Jump to step 7 in the instructions below to finish the install (you might not need to install kubectl)

# Install KIND In Multipass (if the above method doesn't work)
1. Install Multipass: https://multipass.run/docs/installing-on-macos
2. Create a multipass VM: ```multipass launch --name mysql --mem 4G --disk 15G --cpus 2 bionic```
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
sudo /home/ubuntu/go/bin/kind create cluster
```
7. Clone this repo
```
git clone https://github.com/nathanstill/K8S-MySQL-Template.git
```
9. Install Kubectl
```
sudo snap install kubectl --classic
```
10. Apply the YAML file (modify password beforehand)
```
cd K8S-MySQL-Template/
sudo kubectl apply -f ./k8s-mysql-deploy.yaml
sudo kubectl get all --all-namespaces
```
11. Repeat the last command as necessary until all pods are ready
12. Run the following command to expose your mysql database to the local machine (outside the multipass VM)
```
sudo kubectl port-forward --address 0.0.0.0 service/mysql 3306:3306
```
