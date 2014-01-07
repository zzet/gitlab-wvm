echo "mkdir for roles"
mkdir -p ./provisioning/roles
echo "get roles"
ansible-galaxy install bennojoy.nginx --roles-path='./provisioning/roles'
ansible-galaxy install bennojoy.redis --roles-path='./provisioning/roles'
ansible-galaxy install zzet.common --roles-path='./provisioning/roles'
ansible-galaxy install zzet.rbenv --roles-path='./provisioning/roles'
ansible-galaxy install zzet.postgresql --roles-path='./provisioning/roles'
ansible-galaxy install zzet.gitlab --roles-path='./provisioning/roles'
echo ""
echo "please, run vagrant up"
