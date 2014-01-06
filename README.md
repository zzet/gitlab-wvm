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


sample output:

``` bash

[default] Running provisioner: ansible...

PLAY [all] ********************************************************************

GATHERING FACTS ***************************************************************
<127.0.0.1> REMOTE_MODULE setup
ok: [default]

TASK: [zzet.common | checks if resolver is working properly (issues with some VBox/Host OS combinations)] ***
<127.0.0.1> REMOTE_MODULE command host -t A ansible.cc
changed: [default] => {"changed": true, "cmd": ["host", "-t", "A", "ansible.cc"], "delta": "0:00:00.095846", "end": "2014-01-06 19:23:45.856161", "item": "", "rc": 0, "start": "2014-01-06 19:23:45.760315", "stderr": "", "stdout": "ansible.cc has address 97.107.116.231"}

TASK: [zzet.common | pushes new resolver configuration is resolver fails] *****
skipping: [default]

TASK: [zzet.common | checks if resolver is working properly with new nameserver] ***
<127.0.0.1> REMOTE_MODULE command host -t A ansible.cc
changed: [default] => {"changed": true, "cmd": ["host", "-t", "A", "ansible.cc"], "delta": "0:00:00.037473", "end": "2014-01-06 19:23:46.147218", "item": "", "rc": 0, "start": "2014-01-06 19:23:46.109745", "stderr": "", "stdout": "ansible.cc has address 97.107.116.231"}

TASK: [zzet.common | make sure the system encoding is {{locale}}] *************
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0644", "owner": "root", "path": "/etc/default/locale", "size": 40, "state": "file", "uid": 0}

TASK: [zzet.common | ensure apt cache is up to date] **************************
<127.0.0.1> REMOTE_MODULE apt update_cache=yes
ok: [default] => {"changed": false, "item": ""}

TASK: [zzet.common | install  pkgs] *******************************************
<127.0.0.1> REMOTE_MODULE apt pkg=curl,vim,git,runit,htop,atop,imagemagick,python-pycurl
ok: [default] => (item=curl,vim,git,runit,htop,atop,imagemagick,python-pycurl) => {"changed": false, "item": "curl,vim,git,runit,htop,atop,imagemagick,python-pycurl"}

TASK: [zzet.common | create users] ********************************************
<127.0.0.1> REMOTE_MODULE user name=git home=/var/git comment="Gitlab git and run user" generate_ssh_key=yes state=present
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"append": false, "changed": false, "comment": "Gitlab git and run user", "group": 1003, "home": "/var/git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "name": "git", "shell": "/bin/sh", "ssh_fingerprint": "2048 43:d4:f9:67:38:73:20:09:e9:f9:26:3a:42:bf:54:09  ansible-generated (RSA)", "ssh_key_file": "/var/git/.ssh/id_rsa", "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfg9/CVEyA/5qVJnH3whgnMeqh7Ivg/S04yY6MBosKslGAFYB/iTCBRO1eoYYH2Hu5VzlhUVJaibR4Dj8VgX9Pvj6RZwncDPBtlQwosenssqNdPKaVkp4TKAbjbXolTbeLWiBFgeKazoTlqzEiBr+/4Fvf+geqh3htf4OScQXTEccRDqSE9c0y90mvfftYfdsr1b5KwVW6FF7CqzZ1ekDU9RKruUmk21nhIBfSm7qh47tBUDoYXRAwHEbEUeh3u0H1WwU4pKdONaYPYOxQZarOeD8KbsJnI3BWccDfKUi/I371JaUzzLxFbgh+6g7VKYsueeBE5r7IjQMXq0cZQvJ3 ansible-generated", "state": "present", "uid": 1001}
<127.0.0.1> REMOTE_MODULE user name=gitlab home=/home/gitlab comment="Gitlab deploy user" generate_ssh_key=yes state=present
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"append": false, "changed": false, "comment": "Gitlab deploy user", "group": 1004, "home": "/home/gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "name": "gitlab", "shell": "/bin/sh", "ssh_fingerprint": "2048 7f:f4:79:1c:32:0d:b6:58:e7:b9:e1:3a:d9:3e:84:06  ansible-generated (RSA)", "ssh_key_file": "/home/gitlab/.ssh/id_rsa", "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTvJsbB4rqI8MeyywnyXqYbjPsOK4hKSrXw/+RNLCwIY97V2ncDzoZLBo6MXK7uQrfD/Q894CUqV9+SSiB7m3TRa1aeM6DLDdPY+P4OEVkex4C3khhanw8GmAoFiQ4vnZxYu10hT7WV1mHq69zLJ12F4jwMyE95h8sBG6So1IHAArcBN8+r33HaNaNH4NhpU3aZUgnnSkopKJru+97j9SEYNWapRiHnmGGigyor4Il5MqaYoeUUEJIxfieqUta/5pH5sN9+jR9SJ9InxXg1TEHGb+l/4Bn9QXZm1NSCC8AlmKzyGA6tdJPPJIkN0WUC4e0s8e1i97ZDcukhUPFO3x/ ansible-generated", "state": "present", "uid": 1002}

TASK: [zzet.common | add ~/.bashrc to user] ***********************************
<127.0.0.1> REMOTE_MODULE file state=touch dest="/var/git/.bashrc"
changed: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": true, "dest": "/var/git/.bashrc", "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0644", "owner": "git", "size": 3512, "state": "file", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=touch dest="/home/gitlab/.bashrc"
changed: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": true, "dest": "/home/gitlab/.bashrc", "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0644", "owner": "gitlab", "size": 3512, "state": "file", "uid": 1002}

TASK: [zzet.common | update users groups] *************************************
<127.0.0.1> REMOTE_MODULE user name=git groups=git,gitlab
changed: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"append": false, "changed": true, "comment": "Gitlab git and run user", "group": 1003, "groups": "git,gitlab", "home": "/var/git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "name": "git", "shell": "/bin/sh", "state": "present", "uid": 1001}
<127.0.0.1> REMOTE_MODULE user name=gitlab groups=git,gitlab
changed: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"append": false, "changed": true, "comment": "Gitlab deploy user", "group": 1004, "groups": "git,gitlab", "home": "/home/gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "name": "gitlab", "shell": "/bin/sh", "state": "present", "uid": 1002}

TASK: [zzet.common | app_prepare | Create apps users path] ********************
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0755", "owner": "root", "path": "/rest/u/apps", "size": 4096, "state": "directory", "uid": 0}

TASK: [zzet.rbenv | install build depends] ************************************
<127.0.0.1> REMOTE_MODULE apt pkg=build-essential,git,libcurl4-openssl-dev,libreadline-dev,libssl-dev,libxml2-dev,libxslt1-dev,zlib1g-dev state=latest install_recommends=no
ok: [default] => (item=build-essential,git,libcurl4-openssl-dev,libreadline-dev,libssl-dev,libxml2-dev,libxslt1-dev,zlib1g-dev) => {"changed": false, "item": "build-essential,git,libcurl4-openssl-dev,libreadline-dev,libssl-dev,libxml2-dev,libxslt1-dev,zlib1g-dev"}

TASK: [zzet.rbenv | checkout rbenv_repo] **************************************
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv.git dest=~/.rbenv version=v0.4.0
ok: [default] => {"after": "9375e99f921f428849f19efe2a2e500b3295d1a7", "before": "9375e99f921f428849f19efe2a2e500b3295d1a7", "changed": false, "item": ""}

TASK: [zzet.rbenv | create plugins directory] *********************************
<127.0.0.1> REMOTE_MODULE file state=directory path=~/.rbenv/plugins
ok: [default] => {"changed": false, "gid": 1000, "group": "vagrant", "item": "", "mode": "0775", "owner": "vagrant", "path": "/home/vagrant/.rbenv/plugins", "size": 4096, "state": "directory", "uid": 1000}

TASK: [zzet.rbenv | install plugins] ******************************************
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-vars.git dest=~/.rbenv/plugins/rbenv-vars version=v1.2.0
ok: [default] => (item={'repo': 'git://github.com/sstephenson/rbenv-vars.git', 'version': 'v1.2.0', 'name': 'rbenv-vars'}) => {"after": "a75e684c41737d234e78e89e5a56e0543cea882b", "before": "a75e684c41737d234e78e89e5a56e0543cea882b", "changed": false, "item": {"name": "rbenv-vars", "repo": "git://github.com/sstephenson/rbenv-vars.git", "version": "v1.2.0"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/ruby-build.git dest=~/.rbenv/plugins/ruby-build version=v20131225.1
ok: [default] => (item={'repo': 'git://github.com/sstephenson/ruby-build.git', 'version': 'v20131225.1', 'name': 'ruby-build'}) => {"after": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "before": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "changed": false, "item": {"name": "ruby-build", "repo": "git://github.com/sstephenson/ruby-build.git", "version": "v20131225.1"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-default-gems.git dest=~/.rbenv/plugins/rbenv-default-gems version=v1.0.0
ok: [default] => (item={'repo': 'git://github.com/sstephenson/rbenv-default-gems.git', 'version': 'v1.0.0', 'name': 'rbenv-default-gems'}) => {"after": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "before": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "changed": false, "item": {"name": "rbenv-default-gems", "repo": "git://github.com/sstephenson/rbenv-default-gems.git", "version": "v1.0.0"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/fesplugas/rbenv-installer.git dest=~/.rbenv/plugins/rbenv-installer version=8bb9d34d01f78bd22e461038e887d6171706e1ba
ok: [default] => (item={'repo': 'git://github.com/fesplugas/rbenv-installer.git', 'version': '8bb9d34d01f78bd22e461038e887d6171706e1ba', 'name': 'rbenv-installer'}) => {"after": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "before": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "changed": false, "item": {"name": "rbenv-installer", "repo": "git://github.com/fesplugas/rbenv-installer.git", "version": "8bb9d34d01f78bd22e461038e887d6171706e1ba"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-update.git dest=~/.rbenv/plugins/rbenv-update version=32218db487dca7084f0e1954d613927a74bc6f2d
ok: [default] => (item={'repo': 'git://github.com/rkh/rbenv-update.git', 'version': '32218db487dca7084f0e1954d613927a74bc6f2d', 'name': 'rbenv-update'}) => {"after": "32218db487dca7084f0e1954d613927a74bc6f2d", "before": "32218db487dca7084f0e1954d613927a74bc6f2d", "changed": false, "item": {"name": "rbenv-update", "repo": "git://github.com/rkh/rbenv-update.git", "version": "32218db487dca7084f0e1954d613927a74bc6f2d"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-whatis.git dest=~/.rbenv/plugins/rbenv-whatis version=v1.0.0
ok: [default] => (item={'repo': 'git://github.com/rkh/rbenv-whatis.git', 'version': 'v1.0.0', 'name': 'rbenv-whatis'}) => {"after": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "before": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "changed": false, "item": {"name": "rbenv-whatis", "repo": "git://github.com/rkh/rbenv-whatis.git", "version": "v1.0.0"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-use.git dest=~/.rbenv/plugins/rbenv-use version=v1.0.0
ok: [default] => (item={'repo': 'git://github.com/rkh/rbenv-use.git', 'version': 'v1.0.0', 'name': 'rbenv-use'}) => {"after": "bb329487ba783bf42ce4610eeb3292a42a999126", "before": "bb329487ba783bf42ce4610eeb3292a42a999126", "changed": false, "item": {"name": "rbenv-use", "repo": "git://github.com/rkh/rbenv-use.git", "version": "v1.0.0"}}

TASK: [zzet.rbenv | checkout rbenv_repo for selected users] *******************
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv.git dest=~/.rbenv version=v0.4.0
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"after": "9375e99f921f428849f19efe2a2e500b3295d1a7", "before": "9375e99f921f428849f19efe2a2e500b3295d1a7", "changed": false, "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv.git dest=~/.rbenv version=v0.4.0
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"after": "9375e99f921f428849f19efe2a2e500b3295d1a7", "before": "9375e99f921f428849f19efe2a2e500b3295d1a7", "changed": false, "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}}

TASK: [zzet.rbenv | create plugins directory for selected users] **************
<127.0.0.1> REMOTE_MODULE file state=directory path=~/.rbenv/plugins
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0755", "owner": "git", "path": "/var/git/.rbenv/plugins", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=~/.rbenv/plugins
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0755", "owner": "gitlab", "path": "/home/gitlab/.rbenv/plugins", "size": 4096, "state": "directory", "uid": 1002}

TASK: [zzet.rbenv | install plugins for selected users] ***********************
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-vars.git dest=~/.rbenv/plugins/rbenv-vars version=v1.2.0
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/rbenv-vars.git', 'version': 'v1.2.0', 'name': 'rbenv-vars'}]) => {"after": "a75e684c41737d234e78e89e5a56e0543cea882b", "before": "a75e684c41737d234e78e89e5a56e0543cea882b", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-vars", "repo": "git://github.com/sstephenson/rbenv-vars.git", "version": "v1.2.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/ruby-build.git dest=~/.rbenv/plugins/ruby-build version=v20131225.1
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/ruby-build.git', 'version': 'v20131225.1', 'name': 'ruby-build'}]) => {"after": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "before": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "ruby-build", "repo": "git://github.com/sstephenson/ruby-build.git", "version": "v20131225.1"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-default-gems.git dest=~/.rbenv/plugins/rbenv-default-gems version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/rbenv-default-gems.git', 'version': 'v1.0.0', 'name': 'rbenv-default-gems'}]) => {"after": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "before": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-default-gems", "repo": "git://github.com/sstephenson/rbenv-default-gems.git", "version": "v1.0.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/fesplugas/rbenv-installer.git dest=~/.rbenv/plugins/rbenv-installer version=8bb9d34d01f78bd22e461038e887d6171706e1ba
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/fesplugas/rbenv-installer.git', 'version': '8bb9d34d01f78bd22e461038e887d6171706e1ba', 'name': 'rbenv-installer'}]) => {"after": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "before": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-installer", "repo": "git://github.com/fesplugas/rbenv-installer.git", "version": "8bb9d34d01f78bd22e461038e887d6171706e1ba"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-update.git dest=~/.rbenv/plugins/rbenv-update version=32218db487dca7084f0e1954d613927a74bc6f2d
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-update.git', 'version': '32218db487dca7084f0e1954d613927a74bc6f2d', 'name': 'rbenv-update'}]) => {"after": "32218db487dca7084f0e1954d613927a74bc6f2d", "before": "32218db487dca7084f0e1954d613927a74bc6f2d", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-update", "repo": "git://github.com/rkh/rbenv-update.git", "version": "32218db487dca7084f0e1954d613927a74bc6f2d"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-whatis.git dest=~/.rbenv/plugins/rbenv-whatis version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-whatis.git', 'version': 'v1.0.0', 'name': 'rbenv-whatis'}]) => {"after": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "before": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-whatis", "repo": "git://github.com/rkh/rbenv-whatis.git", "version": "v1.0.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-use.git dest=~/.rbenv/plugins/rbenv-use version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-use.git', 'version': 'v1.0.0', 'name': 'rbenv-use'}]) => {"after": "bb329487ba783bf42ce4610eeb3292a42a999126", "before": "bb329487ba783bf42ce4610eeb3292a42a999126", "changed": false, "item": [{"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, {"name": "rbenv-use", "repo": "git://github.com/rkh/rbenv-use.git", "version": "v1.0.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-vars.git dest=~/.rbenv/plugins/rbenv-vars version=v1.2.0
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/rbenv-vars.git', 'version': 'v1.2.0', 'name': 'rbenv-vars'}]) => {"after": "a75e684c41737d234e78e89e5a56e0543cea882b", "before": "a75e684c41737d234e78e89e5a56e0543cea882b", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-vars", "repo": "git://github.com/sstephenson/rbenv-vars.git", "version": "v1.2.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/ruby-build.git dest=~/.rbenv/plugins/ruby-build version=v20131225.1
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/ruby-build.git', 'version': 'v20131225.1', 'name': 'ruby-build'}]) => {"after": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "before": "69f8dcc8b7cc746be3b0ca7008606d2302bb5f09", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "ruby-build", "repo": "git://github.com/sstephenson/ruby-build.git", "version": "v20131225.1"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/sstephenson/rbenv-default-gems.git dest=~/.rbenv/plugins/rbenv-default-gems version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/sstephenson/rbenv-default-gems.git', 'version': 'v1.0.0', 'name': 'rbenv-default-gems'}]) => {"after": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "before": "a8ce628f4e0ad3ff043f6e260c81f11e5c602f77", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-default-gems", "repo": "git://github.com/sstephenson/rbenv-default-gems.git", "version": "v1.0.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/fesplugas/rbenv-installer.git dest=~/.rbenv/plugins/rbenv-installer version=8bb9d34d01f78bd22e461038e887d6171706e1ba
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/fesplugas/rbenv-installer.git', 'version': '8bb9d34d01f78bd22e461038e887d6171706e1ba', 'name': 'rbenv-installer'}]) => {"after": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "before": "8bb9d34d01f78bd22e461038e887d6171706e1ba", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-installer", "repo": "git://github.com/fesplugas/rbenv-installer.git", "version": "8bb9d34d01f78bd22e461038e887d6171706e1ba"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-update.git dest=~/.rbenv/plugins/rbenv-update version=32218db487dca7084f0e1954d613927a74bc6f2d
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-update.git', 'version': '32218db487dca7084f0e1954d613927a74bc6f2d', 'name': 'rbenv-update'}]) => {"after": "32218db487dca7084f0e1954d613927a74bc6f2d", "before": "32218db487dca7084f0e1954d613927a74bc6f2d", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-update", "repo": "git://github.com/rkh/rbenv-update.git", "version": "32218db487dca7084f0e1954d613927a74bc6f2d"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-whatis.git dest=~/.rbenv/plugins/rbenv-whatis version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-whatis.git', 'version': 'v1.0.0', 'name': 'rbenv-whatis'}]) => {"after": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "before": "1394c37195bee3b8ed7cce6340323f9e53bd3868", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-whatis", "repo": "git://github.com/rkh/rbenv-whatis.git", "version": "v1.0.0"}]}
<127.0.0.1> REMOTE_MODULE git repo=git://github.com/rkh/rbenv-use.git dest=~/.rbenv/plugins/rbenv-use version=v1.0.0
ok: [default] => (item=[{'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, {'repo': 'git://github.com/rkh/rbenv-use.git', 'version': 'v1.0.0', 'name': 'rbenv-use'}]) => {"after": "bb329487ba783bf42ce4610eeb3292a42a999126", "before": "bb329487ba783bf42ce4610eeb3292a42a999126", "changed": false, "item": [{"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, {"name": "rbenv-use", "repo": "git://github.com/rkh/rbenv-use.git", "version": "v1.0.0"}]}

TASK: [zzet.rbenv | add rbenv initialization to profile] **********************
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0755", "owner": "root", "path": "/etc/profile.d/rbenv.sh", "size": 132, "state": "file", "uid": 0}

TASK: [zzet.rbenv | set default-gems] *****************************************
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0644", "owner": "git", "path": "/var/git/.rbenv/default-gems", "size": 8, "state": "file", "uid": 1001}
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0644", "owner": "gitlab", "path": "/home/gitlab/.rbenv/default-gems", "size": 8, "state": "file", "uid": 1002}

TASK: [zzet.rbenv | set gemrc] ************************************************
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0644", "owner": "git", "path": "/var/git/.gemrc", "size": 90, "state": "file", "uid": 1001}
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0644", "owner": "gitlab", "path": "/home/gitlab/.gemrc", "size": 90, "state": "file", "uid": 1002}

TASK: [zzet.rbenv | set vars] *************************************************
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0644", "owner": "git", "path": "/var/git/.rbenv/vars", "size": 31, "state": "file", "uid": 1001}
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0644", "owner": "gitlab", "path": "/home/gitlab/.rbenv/vars", "size": 31, "state": "file", "uid": 1002}

TASK: [zzet.rbenv | check ruby {{rbenv.ruby_version}} installed] **************
<127.0.0.1> REMOTE_MODULE command bash -lc "rbenv versions | grep 2.0.0-p247" #USE_SHELL
changed: [default] => {"changed": true, "cmd": "bash -lc \"rbenv versions | grep 2.0.0-p247\" ", "delta": "0:00:00.372556", "end": "2014-01-06 19:25:00.000629", "item": "", "rc": 0, "start": "2014-01-06 19:24:59.628073", "stderr": "", "stdout": "* 2.0.0-p247 (set by /home/vagrant/.rbenv/version)"}

TASK: [zzet.rbenv | install ruby {{rbenv.ruby_version}}] **********************
skipping: [default]

TASK: [zzet.rbenv | install ruby {{rbenv.ruby_version}}] **********************
skipping: [default]

TASK: [zzet.rbenv | check ruby {{rbenv.ruby_version}} installed] **************
<127.0.0.1> REMOTE_MODULE command bash -lc "rbenv versions | grep 2.0.0-p247" #USE_SHELL
changed: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": true, "cmd": "bash -lc \"rbenv versions | grep 2.0.0-p247\" ", "delta": "0:00:00.324696", "end": "2014-01-06 19:25:00.611363", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "rc": 0, "start": "2014-01-06 19:25:00.286667", "stderr": "", "stdout": "* 2.0.0-p247 (set by /var/git/.rbenv/version)"}
<127.0.0.1> REMOTE_MODULE command bash -lc "rbenv versions | grep 2.0.0-p247" #USE_SHELL
changed: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": true, "cmd": "bash -lc \"rbenv versions | grep 2.0.0-p247\" ", "delta": "0:00:00.349143", "end": "2014-01-06 19:25:01.298762", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "rc": 0, "start": "2014-01-06 19:25:00.949619", "stderr": "", "stdout": "* 2.0.0-p247 (set by /home/gitlab/.rbenv/version)"}

TASK: [zzet.rbenv | chown permission to .rbenv directory] *********************
skipping: [default] => (item=[{'item': {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.324696', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:00.611363', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /var/git/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.286667'}, {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}])
skipping: [default] => (item=[{'item': {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.349143', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:01.298762', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /home/gitlab/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.949619'}, {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}])

TASK: [zzet.rbenv | install ruby {{rbenv.ruby_version}}] **********************
skipping: [default] => (item=[{'item': {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.324696', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:00.611363', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /var/git/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.286667'}, {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}])
skipping: [default] => (item=[{'item': {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.349143', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:01.298762', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /home/gitlab/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.949619'}, {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}])

TASK: [zzet.rbenv | install ruby {{rbenv.ruby_version}}] **********************
skipping: [default] => (item=[{'item': {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.324696', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:00.611363', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /var/git/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.286667'}, {'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}])
skipping: [default] => (item=[{'item': {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}, u'delta': u'0:00:00.349143', u'cmd': u'bash -lc "rbenv versions | grep 2.0.0-p247" ', u'end': u'2014-01-06 19:25:01.298762', u'stderr': u'', u'stdout': u'* 2.0.0-p247 (set by /home/gitlab/.rbenv/version)', 'invocation': {'module_name': 'shell', 'module_args': u'bash -lc "rbenv versions | grep 2.0.0-p247"'}, u'changed': True, u'rc': 0, u'start': u'2014-01-06 19:25:00.949619'}, {'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}])

TASK: [zzet.postgresql | Add repository] **************************************
<127.0.0.1> REMOTE_MODULE apt_repository repo='ppa:pitti/postgresql'
ok: [default] => {"changed": false, "item": "", "repo": "ppa:pitti/postgresql", "state": "present"}

TASK: [zzet.postgresql | Ensure apt cache is up to date] **********************
<127.0.0.1> REMOTE_MODULE apt update_cache=yes
ok: [default] => {"changed": false, "item": ""}

TASK: [zzet.postgresql | Ensure packages are installed] ***********************
<127.0.0.1> REMOTE_MODULE apt pkg=postgresql-9.2,postgresql-client-9.2,postgresql-contrib-9.2,postgresql-server-dev-9.2,libpq-dev,python-psycopg2
ok: [default] => (item=postgresql-9.2,postgresql-client-9.2,postgresql-contrib-9.2,postgresql-server-dev-9.2,libpq-dev,python-psycopg2) => {"changed": false, "item": "postgresql-9.2,postgresql-client-9.2,postgresql-contrib-9.2,postgresql-server-dev-9.2,libpq-dev,python-psycopg2"}

TASK: [zzet.postgresql | Setup postgres cluster to default to utf8 | stop cluster] ***
skipping: [default]

TASK: [zzet.postgresql | Setup postgres cluster to default to utf8 | start cluster] ***
skipping: [default]

TASK: [zzet.postgresql | Update pg_hba.conf file] *****************************
ok: [default] => {"changed": false, "gid": 112, "group": "postgres", "item": "", "mode": "0640", "owner": "postgres", "path": "/etc/postgresql/9.2/main/pg_hba.conf", "size": 647, "state": "file", "uid": 106}

TASK: [zzet.postgresql | Update postgres.conf file] ***************************
ok: [default] => {"changed": false, "gid": 112, "group": "postgres", "item": "", "mode": "0644", "owner": "postgres", "path": "/etc/postgresql/9.2/main/postgresql.conf", "size": 25520, "state": "file", "uid": 106}

TASK: [bennojoy.redis | Add the OS specific varibles] *************************
ok: [default] => {"ansible_facts": {"redis_conf_dest": "/etc/redis/redis.conf", "redis_service": "redis-server"}, "item": ""}

TASK: [bennojoy.redis | Install the epel packages] ****************************
skipping: [default]

TASK: [bennojoy.redis | Install the Redis packages] ***************************
skipping: [default]

TASK: [bennojoy.redis | Install the Redis packages] ***************************
<127.0.0.1> REMOTE_MODULE apt name=python-selinux,redis-server state=present update_cache=yes
ok: [default] => (item=python-selinux,redis-server) => {"changed": false, "item": "python-selinux,redis-server"}

TASK: [bennojoy.redis | Copy the redis configuration file] ********************
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0644", "owner": "root", "path": "/etc/redis/redis.conf", "size": 17625, "state": "file", "uid": 0}

TASK: [bennojoy.redis | Set the kernel paramter for vm overcommit] ************
<127.0.0.1> REMOTE_MODULE sysctl name=vm.overcommit_memory value=1 state=present
ok: [default] => {"changed": false, "checks": "both", "item": "", "name": "vm.overcommit_memory", "reload": true, "state": "present", "sysctl_file": "/etc/sysctl.conf", "value": "1"}

TASK: [bennojoy.redis | start the redis service] ******************************
<127.0.0.1> REMOTE_MODULE service name=redis-server state=started enabled=yes
changed: [default] => {"changed": true, "enabled": true, "item": "", "name": "redis-server", "state": "started"}

TASK: [bennojoy.nginx | Install the selinux python module] ********************
skipping: [default]

TASK: [bennojoy.nginx | Copy the epel packages] *******************************
skipping: [default]

TASK: [bennojoy.nginx | Install the nginx packages] ***************************
skipping: [default]

TASK: [bennojoy.nginx | Install the nginx packages] ***************************
<127.0.0.1> REMOTE_MODULE apt name=python-selinux,nginx state=present update_cache=yes
ok: [default] => (item=python-selinux,nginx) => {"changed": false, "item": "python-selinux,nginx"}

TASK: [bennojoy.nginx | Create the directories for site specific configurations] ***
<127.0.0.1> REMOTE_MODULE file path=/etc/nginx/sites-available state=directory owner=root group=root mode=0755
ok: [default] => (item=sites-available) => {"changed": false, "gid": 0, "group": "root", "item": "sites-available", "mode": "0755", "owner": "root", "path": "/etc/nginx/sites-available", "size": 4096, "state": "directory", "uid": 0}
<127.0.0.1> REMOTE_MODULE file path=/etc/nginx/sites-enabled state=directory owner=root group=root mode=0755
ok: [default] => (item=sites-enabled) => {"changed": false, "gid": 0, "group": "root", "item": "sites-enabled", "mode": "0755", "owner": "root", "path": "/etc/nginx/sites-enabled", "size": 4096, "state": "directory", "uid": 0}

TASK: [bennojoy.nginx | Copy the nginx configuration file] ********************
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0644", "owner": "root", "path": "/etc/nginx/nginx.conf", "size": 730, "state": "file", "uid": 0}

TASK: [bennojoy.nginx | Copy the nginx default configuration file] ************
ok: [default] => {"changed": false, "gid": 1000, "group": "vagrant", "item": "", "mode": "0600", "owner": "vagrant", "path": "/etc/nginx/conf.d/default.conf", "size": 180, "state": "file", "uid": 1000}

TASK: [bennojoy.nginx | Copy the nginx default site configuration file] *******
ok: [default] => {"changed": false, "gid": 0, "group": "root", "item": "", "mode": "0644", "owner": "root", "path": "/etc/nginx/sites-available/default", "size": 175, "state": "file", "uid": 0}

TASK: [bennojoy.nginx | Create the link for site enabled specific configurations] ***
<127.0.0.1> REMOTE_MODULE file path=/etc/nginx/sites-enabled/default state=link src=/etc/nginx/sites-available/default
ok: [default] => {"changed": false, "dest": "/etc/nginx/sites-enabled/default", "gid": 0, "group": "root", "item": "", "mode": "0777", "owner": "root", "size": 34, "src": "/etc/nginx/sites-available/default", "state": "link", "uid": 0}

TASK: [bennojoy.nginx | Create the configurations for sites] ******************
ok: [default] => (item={'server': {'server_name': 'localhost', 'file_name': 'foo', 'location2': {'name': '/images/', 'try_files': u'$uri $uri/ /index.html'}, 'location1': {'name': '/', 'try_files': u'$uri $uri/ /index.html'}, 'root': '/tmp/site1', 'listen': 8080}}) => {"changed": false, "gid": 1000, "group": "vagrant", "item": {"server": {"file_name": "foo", "listen": 8080, "location1": {"name": "/", "try_files": "$uri $uri/ /index.html"}, "location2": {"name": "/images/", "try_files": "$uri $uri/ /index.html"}, "root": "/tmp/site1", "server_name": "localhost"}}, "mode": "0600", "owner": "vagrant", "path": "/etc/nginx/conf.d/foo.conf", "size": 197, "state": "file", "uid": 1000}
ok: [default] => (item={'server': {'server_name': 'ansible', 'file_name': 'bar', 'location2': {'name': '/images/', 'try_files': u'$uri $uri/ /index.html'}, 'location1': {'name': '/', 'try_files': u'$uri $uri/ /index.html'}, 'root': '/tmp/site2', 'listen': 9090}}) => {"changed": false, "gid": 1000, "group": "vagrant", "item": {"server": {"file_name": "bar", "listen": 9090, "location1": {"name": "/", "try_files": "$uri $uri/ /index.html"}, "location2": {"name": "/images/", "try_files": "$uri $uri/ /index.html"}, "root": "/tmp/site2", "server_name": "ansible"}}, "mode": "0600", "owner": "vagrant", "path": "/etc/nginx/conf.d/bar.conf", "size": 195, "state": "file", "uid": 1000}

TASK: [bennojoy.nginx | start the nginx service] ******************************
<127.0.0.1> REMOTE_MODULE service name=nginx state=started enabled=yes
ok: [default] => {"changed": false, "enabled": true, "item": "", "name": "nginx", "state": "started"}

TASK: [zzet.gitlab | include env vars] ****************************************
ok: [default] => {"ansible_facts": {"gitlab_env": "development", "gitlab_web_branch": "develop", "gitlab_web_databases": [{"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_development", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}, {"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_test", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}], "gitlab_web_repo": "git://github.com/Undev/gitlabhq.git", "gitlab_web_version": "6.4"}, "item": ""}

TASK: [zzet.gitlab | install dependencies] ************************************
<127.0.0.1> REMOTE_MODULE apt name=build-essential,zlib1g-dev,libyaml-dev,libssl-dev,libgdbm-dev,libreadline-dev,libncurses5-dev,libffi-dev,curl,git-core,openssh-server,checkinstall,libxml2-dev,libxslt1-dev,libcurl4-openssl-dev,libicu-dev,python,openssl state=present update_cache=yes cache_valid_time=900
ok: [default] => (item=build-essential,zlib1g-dev,libyaml-dev,libssl-dev,libgdbm-dev,libreadline-dev,libncurses5-dev,libffi-dev,curl,git-core,openssh-server,checkinstall,libxml2-dev,libxslt1-dev,libcurl4-openssl-dev,libicu-dev,python,openssl) => {"changed": false, "item": "build-essential,zlib1g-dev,libyaml-dev,libssl-dev,libgdbm-dev,libreadline-dev,libncurses5-dev,libffi-dev,curl,git-core,openssh-server,checkinstall,libxml2-dev,libxslt1-dev,libcurl4-openssl-dev,libicu-dev,python,openssl"}

TASK: [zzet.gitlab | ensgure created {{item.comment}}] ************************
<127.0.0.1> REMOTE_MODULE user state=present name=git comment="Gitlab git and run user" home=/var/git groups=git,gitlab generate_ssh_key=yes
changed: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"append": false, "changed": true, "comment": "Gitlab git and run user", "group": 1003, "groups": "git,gitlab", "home": "/var/git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "name": "git", "shell": "/bin/sh", "ssh_fingerprint": "2048 43:d4:f9:67:38:73:20:09:e9:f9:26:3a:42:bf:54:09  ansible-generated (RSA)", "ssh_key_file": "/var/git/.ssh/id_rsa", "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfg9/CVEyA/5qVJnH3whgnMeqh7Ivg/S04yY6MBosKslGAFYB/iTCBRO1eoYYH2Hu5VzlhUVJaibR4Dj8VgX9Pvj6RZwncDPBtlQwosenssqNdPKaVkp4TKAbjbXolTbeLWiBFgeKazoTlqzEiBr+/4Fvf+geqh3htf4OScQXTEccRDqSE9c0y90mvfftYfdsr1b5KwVW6FF7CqzZ1ekDU9RKruUmk21nhIBfSm7qh47tBUDoYXRAwHEbEUeh3u0H1WwU4pKdONaYPYOxQZarOeD8KbsJnI3BWccDfKUi/I371JaUzzLxFbgh+6g7VKYsueeBE5r7IjQMXq0cZQvJ3 ansible-generated", "state": "present", "uid": 1001}
<127.0.0.1> REMOTE_MODULE user state=present name=gitlab comment="Gitlab deploy user" home=/home/gitlab groups=git,gitlab generate_ssh_key=yes
changed: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"append": false, "changed": true, "comment": "Gitlab deploy user", "group": 1004, "groups": "git,gitlab", "home": "/home/gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "name": "gitlab", "shell": "/bin/sh", "ssh_fingerprint": "2048 7f:f4:79:1c:32:0d:b6:58:e7:b9:e1:3a:d9:3e:84:06  ansible-generated (RSA)", "ssh_key_file": "/home/gitlab/.ssh/id_rsa", "ssh_public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTvJsbB4rqI8MeyywnyXqYbjPsOK4hKSrXw/+RNLCwIY97V2ncDzoZLBo6MXK7uQrfD/Q894CUqV9+SSiB7m3TRa1aeM6DLDdPY+P4OEVkex4C3khhanw8GmAoFiQ4vnZxYu10hT7WV1mHq69zLJ12F4jwMyE95h8sBG6So1IHAArcBN8+r33HaNaNH4NhpU3aZUgnnSkopKJru+97j9SEYNWapRiHnmGGigyor4Il5MqaYoeUUEJIxfieqUta/5pH5sN9+jR9SJ9InxXg1TEHGb+l/4Bn9QXZm1NSCC8AlmKzyGA6tdJPPJIkN0WUC4e0s8e1i97ZDcukhUPFO3x/ ansible-generated", "state": "present", "uid": 1002}

TASK: [zzet.gitlab | enshure created {{item.comment}} .ssh directory] *********
<127.0.0.1> REMOTE_MODULE file state=directory path=/var/git/.ssh owner=git group=git mode=700
ok: [default] => (item={'comment': 'Gitlab git and run user', 'home': '/var/git', 'name': 'git', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"comment": "Gitlab git and run user", "groups": "git,gitlab", "home": "/var/git", "name": "git"}, "mode": "0700", "owner": "git", "path": "/var/git/.ssh", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/home/gitlab/.ssh owner=gitlab group=gitlab mode=700
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0700", "owner": "gitlab", "path": "/home/gitlab/.ssh", "size": 4096, "state": "directory", "uid": 1002}

TASK: [zzet.gitlab | Upload SSH authorized_keys for {{item.comment}}.] ********
ok: [default] => (item={'comment': 'Gitlab deploy user', 'home': '/home/gitlab', 'name': 'gitlab', 'groups': 'git,gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"comment": "Gitlab deploy user", "groups": "git,gitlab", "home": "/home/gitlab", "name": "gitlab"}, "mode": "0600", "owner": "gitlab", "path": "/home/gitlab/.ssh/authorized_keys", "size": 0, "state": "file", "uid": 1002}

TASK: [zzet.gitlab | create project directory] ********************************
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab owner=gitlab group=git
ok: [default] => (item={'owner': u'gitlab', 'path': u'/rest/u/apps/gitlab', 'group': u'git'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"group": "git", "owner": "gitlab", "path": "/rest/u/apps/gitlab"}, "mode": "0755", "owner": "gitlab", "path": "/rest/u/apps/gitlab", "size": 4096, "state": "directory", "uid": 1002}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/releases owner=gitlab group=git
ok: [default] => (item={'owner': u'gitlab', 'path': u'/rest/u/apps/gitlab/releases', 'group': u'git'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"group": "git", "owner": "gitlab", "path": "/rest/u/apps/gitlab/releases"}, "mode": "0755", "owner": "gitlab", "path": "/rest/u/apps/gitlab/releases", "size": 4096, "state": "directory", "uid": 1002}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared/gitlab-satellites owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared/gitlab-satellites', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared/gitlab-satellites"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared/gitlab-satellites", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared/uploads owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared/uploads', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared/uploads"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared/uploads", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared/log owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared/log', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared/log"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared/log", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared/system owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared/system', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared/system"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared/system", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab/shared/pids owner=git group=gitlab
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab/shared/pids', 'group': u'gitlab'}) => {"changed": false, "gid": 1004, "group": "gitlab", "item": {"group": "gitlab", "owner": "git", "path": "/rest/u/apps/gitlab/shared/pids"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab/shared/pids", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab-shell owner=git group=git
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab-shell', 'group': u'git'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"group": "git", "owner": "git", "path": "/rest/u/apps/gitlab-shell"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab-shell", "size": 4096, "state": "directory", "uid": 1001}
<127.0.0.1> REMOTE_MODULE file state=directory path=/rest/u/apps/gitlab-shell/releases owner=git group=git
ok: [default] => (item={'owner': u'git', 'path': u'/rest/u/apps/gitlab-shell/releases', 'group': u'git'}) => {"changed": false, "gid": 1003, "group": "git", "item": {"group": "git", "owner": "git", "path": "/rest/u/apps/gitlab-shell/releases"}, "mode": "0755", "owner": "git", "path": "/rest/u/apps/gitlab-shell/releases", "size": 4096, "state": "directory", "uid": 1001}

TASK: [zzet.gitlab | postgresql | ensure user does not have unnecessary privilege ({{gitlab_env}} enviroment)] ***
<127.0.0.1> REMOTE_MODULE postgresql_user name=gitlab password= role_attr_flags=NOSUPERUSER,CREATEDB
changed: [default] => (item={'name': 'gitlab_development', 'encoding': 'UTF-8', 'locale': 'en_US.UTF-8', 'adapter': 'postgresql', 'user': 'gitlab', 'password': '', 'role_attr_flags': 'NOSUPERUSER,CREATEDB'}) => {"changed": true, "item": {"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_development", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}, "user": "gitlab"}
<127.0.0.1> REMOTE_MODULE postgresql_user name=gitlab password= role_attr_flags=NOSUPERUSER,CREATEDB
ok: [default] => (item={'name': 'gitlab_test', 'encoding': 'UTF-8', 'locale': 'en_US.UTF-8', 'adapter': 'postgresql', 'user': 'gitlab', 'password': '', 'role_attr_flags': 'NOSUPERUSER,CREATEDB'}) => {"changed": false, "item": {"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_test", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}, "user": "gitlab"}

TASK: [zzet.gitlab | postgresql | ensure {{gitlab_env}} database is created] ***
<127.0.0.1> REMOTE_MODULE postgresql_db name=gitlab_development owner=gitlab encoding=UTF-8 lc_collate=en_US.UTF-8 lc_ctype=en_US.UTF-8 template='template0' state=present
changed: [default] => (item={'name': 'gitlab_development', 'encoding': 'UTF-8', 'locale': 'en_US.UTF-8', 'adapter': 'postgresql', 'user': 'gitlab', 'password': '', 'role_attr_flags': 'NOSUPERUSER,CREATEDB'}) => {"changed": true, "db": "gitlab_development", "item": {"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_development", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}}
<127.0.0.1> REMOTE_MODULE postgresql_db name=gitlab_test owner=gitlab encoding=UTF-8 lc_collate=en_US.UTF-8 lc_ctype=en_US.UTF-8 template='template0' state=present
changed: [default] => (item={'name': 'gitlab_test', 'encoding': 'UTF-8', 'locale': 'en_US.UTF-8', 'adapter': 'postgresql', 'user': 'gitlab', 'password': '', 'role_attr_flags': 'NOSUPERUSER,CREATEDB'}) => {"changed": true, "db": "gitlab_test", "item": {"adapter": "postgresql", "encoding": "UTF-8", "locale": "en_US.UTF-8", "name": "gitlab_test", "password": "", "role_attr_flags": "NOSUPERUSER,CREATEDB", "user": "gitlab"}}

TASK: [zzet.gitlab | nginx | update nginx config] *****************************
skipping: [default]

TASK: [zzet.gitlab | nginx | enable app] **************************************
skipping: [default]

TASK: [zzet.gitlab | runit | create application  script directory] ************
skipping: [default] => (item={'queue': 'post_receive,build_result,project_web_hook,system_hook,common,default', 'concurency': 5, 'name': 'main', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'mail_notifications,mailer', 'concurency': 10, 'name': 'mail', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'gitlab_shell', 'concurency': 3, 'name': 'shell', 'service': 'sidekiq'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'web', 'backlog': 1000, 'port': u'9000'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'api', 'backlog': 1000, 'port': u'9001'})

TASK: [zzet.gitlab | runit | create application  script log directory] ********
skipping: [default] => (item={'queue': 'post_receive,build_result,project_web_hook,system_hook,common,default', 'concurency': 5, 'name': 'main', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'mail_notifications,mailer', 'concurency': 10, 'name': 'mail', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'gitlab_shell', 'concurency': 3, 'name': 'shell', 'service': 'sidekiq'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'web', 'backlog': 1000, 'port': u'9000'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'api', 'backlog': 1000, 'port': u'9001'})

TASK: [zzet.gitlab | runit | add application  script] *************************
skipping: [default] => (item={'queue': 'post_receive,build_result,project_web_hook,system_hook,common,default', 'concurency': 5, 'name': 'main', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'mail_notifications,mailer', 'concurency': 10, 'name': 'mail', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'gitlab_shell', 'concurency': 3, 'name': 'shell', 'service': 'sidekiq'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'web', 'backlog': 1000, 'port': u'9000'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'api', 'backlog': 1000, 'port': u'9001'})

TASK: [zzet.gitlab | runit | add application  log run script] *****************
skipping: [default] => (item={'queue': 'post_receive,build_result,project_web_hook,system_hook,common,default', 'concurency': 5, 'name': 'main', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'mail_notifications,mailer', 'concurency': 10, 'name': 'mail', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'gitlab_shell', 'concurency': 3, 'name': 'shell', 'service': 'sidekiq'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'web', 'backlog': 1000, 'port': u'9000'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'api', 'backlog': 1000, 'port': u'9001'})

TASK: [zzet.gitlab | runit | symlink  dir to enable runit service] ************
skipping: [default] => (item={'queue': 'post_receive,build_result,project_web_hook,system_hook,common,default', 'concurency': 5, 'name': 'main', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'mail_notifications,mailer', 'concurency': 10, 'name': 'mail', 'service': 'sidekiq'})
skipping: [default] => (item={'queue': 'gitlab_shell', 'concurency': 3, 'name': 'shell', 'service': 'sidekiq'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'web', 'backlog': 1000, 'port': u'9000'})
skipping: [default] => (item={'workers': 3, 'service': u'puma', 'name': 'api', 'backlog': 1000, 'port': u'9001'})

PLAY RECAP ********************************************************************
default                    : ok=57   changed=10   unreachable=0    failed=0
```
