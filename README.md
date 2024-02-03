# Deploying Dockerized Application to EC2 with GitHub Actions
This repository demonstrates how to automate the deployment of a Dockerized application to an EC2 instance using GitHub Actions.

### Workflow Overview
The GitHub Actions workflow in this repository automates the following tasks:

- **Build and Push Docker Image:** The workflow builds a Docker image from the provided Dockerfile, tags it with the appropriate Docker Hub username and image name, and then pushes it to Docker Hub for easy access.

- **Deploy to EC2:** After successfully building and pushing the Docker image, the workflow deploys the image to an EC2 instance. This step involves SSH-ing into the EC2 instance and executing a deployment script (deploy.sh) to pull the Docker image and run the container.

### Getting Started
To use this workflow for deploying your Dockerized application to an EC2 instance, follow these steps:

- Set Up EC2 Instance: Ensure that you have an EC2 instance running and accessible from the internet. Docker should be installed on the EC2 instance.

- Configure SSH Access: Create an SSH key pair and add the public key to your EC2 instance's authorized_keys file so that GitHub Actions can SSH into the instance and execute commands.

- Update Workflow Secrets: Add your Docker Hub credentials and SSH private key as secrets in your GitHub repository settings. Ensure that sensitive information like SSH keys and Docker Hub credentials are properly secured using GitHub Secrets.

- Update Workflow Variables: Replace the placeholders in the workflow file (cicd.yml) with your actual values:

    `$SSH_PRIVATE_KEY`: Your SSH private key.

    `$EC2_PUBLIC_IP`: Public IP address of your EC2 instance.

    `your-image-name`: Name of your Docker image.

- Create Deployment Script: Create a `deploy.sh` script that contains the necessary commands to pull the Docker image from Docker Hub and run the container on your EC2 instance.

- Test and Customize: Test the workflow and deployment process. Customize the workflow and deployment script as needed based on your application requirements.

### Workflow File Structure
`.github/workflows/cicd.yml`: GitHub Actions workflow file responsible for building, pushing, and deploying the Dockerized application.

`deploy.sh`: Deployment script to be executed on the EC2 instance for pulling the Docker image and running the container.
