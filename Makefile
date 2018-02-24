package = Mac Machine Setup Awesome

create-hosts-file:
	echo "#localhost	ansible_connection=local" >hosts
	echo "docker.for.mac.host.internal ansible_connection=ssh ansible_user=${MACUSER}" >>hosts

install: create-hosts-file
	ansible-playbook playbook.yml -vvv -i hosts --ask-vault-pass --private-key=~/.ssh/id_rsa

atom-plugins:
	ansible-playbook -i hosts --private-key=~/.ssh/id_rsa roles/atom/atom-packages.yml
