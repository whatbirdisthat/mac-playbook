# Mac Playbook
---
## A no-frills set-up-my-mac script

	Why are you so obsessed with automatically .....

> Because automate.

### I have blanked my mac and re-run this a few times
### And it works.

```bash
ansible-playbook playbook.yml -i hosts --ask-vault-pass
```

The above will run the playbook on localhost.

This assumes you have:

1. Made yourself sudo

	```bash
	echo "$USER    ALL=(ALL) NOPASSWD: ALL" > $USER.sudoer && \
		chmod 600 $USER.sudoer && \
		sudo chown root $USER.sudoer && \
		sudo mv $USER.sudoer /etc/sudoers.d/$USER
	```


2. Installed homebrew

        ```bash
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ```
       

2.1
	You'll probably want to encrypt yourself a HOMEBREW API token if you are not me, because you'll need a decryptable vault variable to use or your homebrew will be rate-limited pretty soon.

3. Installed Ansible.

> Sheesh. That's a lot of messing around so we can automatically all the things....

Hah. Wait until we install `Pass` ... there's manual in there too :(

BUT!

### This will set up a lot of stuff.

TODO: remove the TODOs


