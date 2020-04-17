read -p "Enter your master node IP: " masterIP
read -p "Enter your apiserver name: " apiserver
export MASTER_IP=$masterIP
export APISERVER_NAME=$apiserver
echo "${MASTER_IP}    ${APISERVER_NAME}" >> /etc/hosts