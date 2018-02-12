# Mac Playbook
---

_A no-frills set-up-my-mac script_

### Note:

```
Requires Ansible 2.4+
```

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

  1.1. You have `cat id_rsa.pub >>authorized_keys` while working in `~/.ssh/`

2. Installed homebrew

	```bash
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	```

  2.1.
	You'll probably want to encrypt yourself a HOMEBREW API token if you are not me, because you'll need a decryptable vault variable to use or your homebrew will be rate-limited pretty soon. Use ansible vault to write over the file in `group_vars/all/vars`

  ```ini
  homebrew_token: 'XXXXYYYYZZZZAAAABBBBCCCC'
  other_stuff: 'THINGZ'
  ```


  ```bash
  vim group_vars/all/vars
  ansible-vault encrypt --ask-vault-pass group_vars/all/vars
  ```

3. Installed Ansible. ... OR

  (This is where it gets weird. ...ish)

  ## Choose either _actual_ localhost, or `brew install docker`

4. if you chose `brew install docker` then you'll need to have built [container-ansible](https://github.com/whatbirdisthat/container-ansible) to run this from. Also you win a prize!

5. Remember to write a script to do steps 1-4 ;)

  > Sheesh. That's a lot of messing around so we can automatically all the things....

  Hah. Wait until we install `Pass` ... there's a bunch of manual in there too :(

  BUT!

  ### This will set up a lot of stuff.

---

TODO: remove the TODOs

