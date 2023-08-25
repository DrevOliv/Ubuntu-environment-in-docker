#!/bin/bash
# entrypoint.sh

# Create a new user

username="oliver"  # Replace with the username
password="7533"  # Replace with the password

if id "$username" &>/dev/null; then
    echo "User $username exists."
else
    useradd -m -s /bin/bash $username
    echo "$username:$password" | chpasswd
fi

echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> /home/$username/.bashrc

exec su - $username -c "/bin/bash"
