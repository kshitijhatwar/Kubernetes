#!/bin/bash
# Kubernetes cluster cleanup script for kubeadm-based clusters
# Run as root or with sudo

echo "[INFO] Resetting kubeadm..."
sudo kubeadm reset -f

echo "[INFO] Stopping kubelet and container runtime..."
sudo systemctl stop kubelet
sudo systemctl restart containerd 2>/dev/null || systemctl restart docker 2>/dev/null

echo "[INFO] Removing Kubernetes config and data..."
sudo rm -rf /etc/kubernetes/ \
       /var/lib/etcd \
       /var/lib/kubelet/* \
       /etc/cni/net.d \
       /var/lib/cni/ \
       /opt/cni/bin \
       ~/.kube

echo "[INFO] Flushing iptables..."
sudo iptables -F
sudo  iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -X

echo "[INFO] Removing CNI network interfaces..."
sudo ip link delete cni0 2>/dev/null
sudo ip link delete flannel.1 2>/dev/null
sudo ip link delete weave 2>/dev/null

echo "[INFO] Kubernetes cleanup complete on $(hostname)"
