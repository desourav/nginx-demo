# Install nginx in CentOS/Debian container using ansible role
## Usage :
*Build the images for centos and debian with ansible installed*
```
cd ~/nginx-demo/ansible-role-WIP/centos-Dockerfile
docker build -t centos-ansible .
cd ~/nginx-demo/ansible-role-WIP/debian-Dockerfile
docker build -t debian-ansible .
```
*Build the containers using images *
```
docker run -td centos-ansible 
docker run -td debian-ansible
docker ps
```
*Copy the artifacts to the container*
```
docker cp main.yaml <container-id>:/tmp
docker cp role.nginx/ <container-id>:/tmp
docker cp env/ <container-id>:/tmp
docker exec -it <container-name> /bin/bash
```
### Inside Container : 
```
/usr/bin/ansible-playbook /tmp/main.yaml
 ```

# How to run the ansible playbook (no roles) for installing nginx in CentOS or Debian container
## Assumptions :
1. Ansible is installed
2. Python 2.7 is installed (please change the location in deploy.sh for ansible PATH)
3. docker-py >= 1.7.0
4. Docker API >= 1.20

## Usage :
1. The script can be run from the root of directory nginx-demo, as shown below
2. The script has been made dynamic to support CentOS and Debian
3. The ansible-playbook is designed to install nginx on a CentOS or Debian container
4. If you wish to save the image, please run `docker commit <commit-id> <image-name>`

```
sh-3.2# cd /Users/souravde/Downloads/nginx-demo/
sh-3.2# sh deploy.sh
Enter the image name [centos|debian]
centos
Enter the container name
centos-nginx-demo
ansible 2.5.5
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/var/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /var/root/Library/Python/2.7/lib/python/site-packages/ansible
  executable location = /var/root/Library/Python/2.7/bin/ansible
  python version = 2.7.10 (default, Oct  6 2017, 22:29:07) [GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.31)]
Ansible seems to be installed just fine....
Image Name - centos
Container Name - centos-nginx-demo

PLAY [Create Docker Container] ***************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************
ok: [localhost]

TASK [include variables] *********************************************************************************************************************************************************************************
ok: [localhost]

TASK [Install python-docker on Red Hat based distribution] ***********************************************************************************************************************************************
skipping: [localhost]

TASK [Install python-docker  on Debian based distribution] ***********************************************************************************************************************************************
skipping: [localhost]

TASK [Create Container] **********************************************************************************************************************************************************************************
changed: [localhost]

TASK [Check container type CentOS] ***********************************************************************************************************************************************************************
changed: [localhost]

TASK [CentOS Install epel-release] ***********************************************************************************************************************************************************************
changed: [localhost]

TASK [CentOS Install nginx] ******************************************************************************************************************************************************************************
changed: [localhost]

TASK [Check container type Debian] ***********************************************************************************************************************************************************************
fatal: [localhost]: FAILED! => {"changed": true, "cmd": ["/bin/sh", "check_OS_debian.sh", "centos-nginx-demo"], "delta": "0:00:00.074872", "end": "2018-06-19 11:18:14.193838", "msg": "non-zero return code", "rc": 1, "start": "2018-06-19 11:18:14.118966", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
...ignoring

TASK [Debian apt-get update] *****************************************************************************************************************************************************************************
skipping: [localhost]

TASK [Debian apt-get upgrade] ****************************************************************************************************************************************************************************
skipping: [localhost]

TASK [Debian Install nginx] ******************************************************************************************************************************************************************************
skipping: [localhost]

PLAY RECAP ***********************************************************************************************************************************************************************************************
localhost                  : ok=7    changed=5    unreachable=0    failed=0
```

# How to run the helm chart for nginx.
## Assumptions :
1. helm is installed
2. kubernettes is installed
3. minikube for local deployments

## Usage :
1. Run the helm chart by referring the example below
2. If you receive service already exist error, run `kubectl` commands to delete the deployments and services.

```souravs-mbp:nginx-demo souravde$ helm install nginx-helm/
NAME:   brawny-indri
LAST DEPLOYED: Tue Jun 19 10:42:03 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1beta2/Deployment
NAME   DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
nginx  3        3        3           0          0s

==> v1beta1/Ingress
NAME           HOSTS  ADDRESS  PORTS  AGE
nginx-ingress  *      80       0s

==> v1/Pod(related)
NAME                   READY  STATUS             RESTARTS  AGE
nginx-9649d8bc6-bmzdd  0/1    ContainerCreating  0         0s
nginx-9649d8bc6-czvdt  0/1    ContainerCreating  0         0s
nginx-9649d8bc6-njkb6  0/1    ContainerCreating  0         0s

==> v1/Service
NAME   TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)  AGE
nginx  ClusterIP  10.98.247.91  <none>       80/TCP   0s

souravs-mbp:nginx-demo souravde$ kubectl get pods
NAME                    READY     STATUS    RESTARTS   AGE
nginx-9649d8bc6-bmzdd   1/1       Running   0          32s
nginx-9649d8bc6-czvdt   1/1       Running   0          32s
nginx-9649d8bc6-njkb6   1/1       Running   0          32s
```



