package = Mac Machine Setup Awesome

create-hosts-files:
	echo "#localhost	ansible_connection=local" >hosts_secure
	echo "[hosts_secured]" >>hosts_secure
	echo "docker.for.mac.host.internal ansible_connection=ssh ansible_user=${MACUSER}" >>hosts_secure
	echo "[devmac]" >hosts
	echo "#localhost	ansible_connection=local" >>hosts
	echo "docker.for.mac.host.internal ansible_connection=ssh ansible_user=${MACUSER}" >>hosts

install: create-hosts-files
	ansible-playbook playbook.yml -vvv -i hosts_secure --ask-vault-pass --private-key=~/.ssh/id_rsa

atom-plugins: create-hosts-files
	ansible-playbook roles/atom/atom-packages.yml -i hosts --private-key=~/.ssh/id_rsa

show_vars:
	@ansible -m setup all -i hosts --ask-vault-pass > ansible_vars.json

containers:
	@ansible-playbook playbook.yml -i hosts --ask-vault-pass --private-key=~/.ssh/id_rsa --tags "containers_d"
