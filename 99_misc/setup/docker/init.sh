#!/bin/bash
set -x
: ${SSH_USERNAME:=user}
: ${SSH_USERPASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}

create_rundir() {
	mkdir -p /var/run/sshd
}

create_user() {
# Create a user to SSH into as.
useradd $SSH_USERNAME
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $SSH_USERNAME)
echo ssh user password: $SSH_USERPASS
}

create_hostkeys() {
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}

# Call all functions
create_rundir
create_hostkeys
sed -i 's/\#Pubkey/Pubkey/g' /etc/ssh/sshd_config 

echo calling $@
exec "$@"
