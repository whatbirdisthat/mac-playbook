package = Mac Machine Setup Awesome

install:
	@echo "#localhost	ansible_connection=local" >hosts
	@echo "docker.for.mac.host.internal ansible_connection=ssh ansible_user=${MACUSER}" >>hosts
	@ansible-playbook playbook.yml -i hosts --ask-vault-pass --private-key=~/.ssh/id_rsa

