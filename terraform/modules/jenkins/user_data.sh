#!/bin/bash

set -e

# Update system
apt-get update -y

# Install Java 21
apt-get install -y fontconfig openjdk-21-jre

# Add Jenkins repository key
wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

# Update package index
apt-get update -y

# Install Jenkins
apt-get install -y jenkins

# Enable and start Jenkins
systemctl enable jenkins
systemctl start jenkins