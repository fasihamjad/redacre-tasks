# redacre-tasks

Task 1:

Clone the repository and go inside redacre-tasks/task1.
Run command docker compose up -d –build.
I have created 3 Dockerfile backend Dockerfile in /api.
frontend Dockerfile in /sys-stats
Nginx.conf file in which i will add it in my nginx image in docker-compose.yaml file.
Created docker-compose.yaml in which i have defined the network, expose my frontend, backend, my Dockerfile path.
Three containers will be running and the final user can access on port 80

Task 2:

Go in the folder /task2/terraform.
created IAM user and exported credentials into my local machine using export command.
I have created a security group in which I have allowed specific ports opened in inbound rules.
 Setup the ami image, attach keyfile.
Created ssh configuration.
Copy files from my local to the server so i dont have to do it manually.
Install docker
Go to the specific path and run docker compose up -d – build in main.tf file.
![image](https://github.com/fasihamjad/redacre-tasks/assets/55648123/f72a3a88-e5fa-4622-8214-6e39a6fce7e0)


Task3:

Created namespace task3.
Created deployment and service files for my backend and frontend.
Created ingress.yaml to expose the final app on port 80
We will use Loadbalancer in production environment and assign static ips to our backend and frontend.
I have given host helloworld.info on my localhost added it in my /etc/hosts file also.

![image](https://github.com/fasihamjad/redacre-tasks/assets/55648123/210ad40f-6f7d-459c-a6cf-06371f0f9c3c)



