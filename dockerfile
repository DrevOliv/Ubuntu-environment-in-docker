# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set environment variables
ENV NEW_USERNAME=username \
    NEW_PASSWORD=password

RUN apt-get update && apt-get install -y sudo\
    software-properties-common \
    sudo \
    nano \
    wget \
    curl \
    git \
    # Add more packages as needed
    && apt-get clean

# Create a new user and set the password
RUN useradd -m -s /bin/bash $NEW_USERNAME && \
    echo "$NEW_USERNAME:$NEW_PASSWORD" | chpasswd

# Grant sudo privileges to the new user
RUN echo "$NEW_USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> /home/$NEW_USERNAME/.bashrc

# Set the working directory to the new user's home directory
WORKDIR /home/$NEW_USERNAME

# Switch to the new user
USER $NEW_USERNAME





#COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#RUN chmod +x /usr/local/bin/entrypoint.sh


#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#USER oliver
CMD ["/bin/bash"]