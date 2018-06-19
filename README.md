# How to run the ansible playbook for installing nginx in CentOS or Debian container
sh-3.2# cd /Users/souravde/Downloads/nginx-demo/
sh-3.2# sh deploy.sh centos nginx-centos
ansible 2.5.5
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/var/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /var/root/Library/Python/2.7/lib/python/site-packages/ansible
  executable location = /var/root/Library/Python/2.7/bin/ansible
  python version = 2.7.10 (default, Oct  6 2017, 22:29:07) [GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.31)]
Ansible seems to be installed just fine....
Image Name - centos
Container Name - nginx-centos

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
fatal: [localhost]: FAILED! => {"changed": true, "cmd": ["/bin/sh", "check_OS_debian.sh", "nginx-centos"], "delta": "0:00:00.075186", "end": "2018-06-19 10:46:42.517876", "msg": "non-zero return code", "rc": 1, "start": "2018-06-19 10:46:42.442690", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}
...ignoring

TASK [Debian apt-get update] *****************************************************************************************************************************************************************************
skipping: [localhost]

TASK [Debian apt-get upgrade] ****************************************************************************************************************************************************************************
skipping: [localhost]

TASK [Debian Install nginx] ******************************************************************************************************************************************************************************
skipping: [localhost]

PLAY RECAP ***********************************************************************************************************************************************************************************************
localhost                  : ok=7    changed=5    unreachable=0    failed=0   


# How to run the helm chart for nginx.

souravs-mbp:nginx-demo souravde$ helm install nginx-helm/
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


NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app=nginx-helm,release=brawny-indri" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80

souravs-mbp:nginx-demo souravde$ kubectl get pods
NAME                    READY     STATUS    RESTARTS   AGE
nginx-9649d8bc6-bmzdd   1/1       Running   0          32s
nginx-9649d8bc6-czvdt   1/1       Running   0          32s
nginx-9649d8bc6-njkb6   1/1       Running   0          32s

