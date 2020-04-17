
### 软件版本：
* Kubernetes: v1.18.0
  * calico: 3.13.1
  * nginx-ingress: 1.5.5
* docker: 19.03.8

### 初始化 master 节点
在 master 节点上执行 hostname.sh 和 k8s_master_init.sh 脚本

### 初始化 worker 节点
在 master 节点 执行
```bash
$ kubeadm token create --print-join-command # 获取kubeadm join 命令及参数,有效期 2 小时
```
在 worker 节点上执行 k8s_worker_init.sh 脚本和刚刚获得的 kubeadm join 命令

### 检查初始化结果
在 master 节点执行
```bash
$ kubectl get nodes -o wide

NAME      STATUS   ROLES    AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION           CONTAINER-RUNTIME
master    Ready    master   16d   v1.18.0   192.168.7.8     <none>        CentOS Linux 7 (Core)   3.10.0-1062.el7.x86_64   docker://19.3.8
worker1   Ready    <none>   16d   v1.18.0   192.168.5.36    <none>        CentOS Linux 7 (Core)   3.10.0-1062.el7.x86_64   docker://19.3.8
worker2   Ready    <none>   16d   v1.18.0   192.168.6.213   <none>        CentOS Linux 7 (Core)   3.10.0-1062.el7.x86_64   docker://19.3.8
```