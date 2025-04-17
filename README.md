# jenkins_installation_script
# Jenkins Installation Script for RedHat 9

This repository contains a shell script to automate the installation of [Jenkins](https://www.jenkins.io/) on **RedHat 9** systems. It handles everything from installing dependencies to opening the firewall port for Jenkins.

## 🚀 Features

- Installs Jenkins from the official Jenkins repository
- Installs Java 17 (required by Jenkins)
- Enables and starts the Jenkins service
- Opens port `8080` in the firewall
- Displays the initial Jenkins admin password

## 📋 Requirements

- RedHat 9 or a compatible RHEL-based distribution
- `sudo` privileges or root access
- Internet connectivity

## 📦 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/jenkins-redhat-install.git
   cd jenkins-redhat-install

Make the script executable:
chmod +x install_jenkins.sh

Run the script as root or using sudo:
sudo ./install_jenkins.sh

🖥️ Access Jenkins

http://<your-server-ip>:8080





