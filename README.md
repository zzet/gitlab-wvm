- Install ansible (with galaxy) on host machine
- Clone repo
- DOIT:

``` bash
$ cd gitlab-wvm
$ ansible-galaxy install zzet.gitlab --roles-path='./provisioning/roles'
$ vagrant up
```

- Uncomment and edit path to source code in `Vagrantfile`


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/zzet/gitlab-wvm/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

