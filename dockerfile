# Use the official Ubuntu image as the base
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    nano \
    wget \
    curl \
    git \
    # Add more packages as needed
    && apt-get clean

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#USER oliver
CMD ["/bin/bash"]