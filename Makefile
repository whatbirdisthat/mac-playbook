package = Mac Machine Setup Awesome

install:
	ansible-playbook playbook.yml -i hosts --ask-vault-pass
