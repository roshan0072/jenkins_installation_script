#!/bin/bash

# Author: Roshan Jangir
# Purpose: Install Jenkins on RedHat 9

set -e  # Exit on any error

JENKINS_REPO_URL="https://pkg.jenkins.io/redhat/jenkins.repo"
JENKINS_GPG_KEY="https://pkg.jenkins.io/redhat/jenkins.io-2023.key"
JAVA_PACKAGE="java-17-openjdk"
JENKINS_SERVICE_NAME="jenkins"

echo "Updating system packages..."
dnf update -y

echo "Downloading Jenkins repo..."
curl -o /etc/yum.repos.d/jenkins.repo $JENKINS_REPO_URL

echo "Importing Jenkins GPG key..."
rpm --import $JENKINS_GPG_KEY

echo "Installing Java and fontconfig..."
dnf install -y fontconfig $JAVA_PACKAGE

echo "Installing Jenkins..."
dnf install -y $JENKINS_SERVICE_NAME

echo "Reloading systemd daemon..."
systemctl daemon-reexec

echo "Enabling and starting Jenkins service..."
systemctl enable --now $JENKINS_SERVICE_NAME

echo "Opening port 8080 in firewall..."
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload

echo "Waiting a few seconds for Jenkins to generate the initial password..."
sleep 10

echo "Fetching initial Jenkins admin password:"
cat /var/lib/jenkins/secrets/initialAdminPassword