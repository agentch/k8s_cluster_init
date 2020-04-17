./hostname.sh
export REGISTRY_MIRROR=https://registry.cn-hangzhou.aliyuncs.com
curl -sSL https://kuboard.cn/install-script/v1.18.x/install_kubelet.sh | sh -s 1.18.0

read -p "Enter your master node IP: " masterIP
read -p "Enter your apiserver name: " apiserver
export MASTER_IP=$masterIP
export APISERVER_NAME=$apiserver
export POD_SUBNET=10.100.0.1/16
echo "${MASTER_IP}    ${APISERVER_NAME}" >> /etc/hosts
curl -sSL https://kuboard.cn/install-script/v1.18.x/init_master.sh | sh -s 1.18.0
kubectl get pod -n kube-system -o wide
kubectl get nodes -o wide