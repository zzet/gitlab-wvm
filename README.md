1. Install ansible (with galaxy) on host machine
2. clone repo
3.
``` bash
$ cd gitlab-wvm
```
4.
``` bash
$ ansible-galaxy install zzet.gitlab --roles-path='./provisioning/roles'
```
5.
``` bash
$ vagrant up
```
6. Uncomment and edit path to source code
