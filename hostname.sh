#!/bin/bash
read -p "Enter your hostname: " hostname
hostnamectl set-hostname $hostname
hostnamectl status
echo "127.0.0.1 $(hostname)" >> /etc/hosts
exit 