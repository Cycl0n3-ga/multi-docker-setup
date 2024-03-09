FROM ubuntu:latest

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server curl
RUN mkdir /var/run/sshd
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh ./get-docker.sh 
#RUN apt-get update && apt-get install -y curl \
#    && mkdir -m 0755 -p /etc/apt/keyrings \
#    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
#    && chmod a+r /etc/apt/keyrings/docker.asc \
#    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" \
#    | tee /etc/apt/sources.list.d/docker.list > /dev/null \
#    && apt-get update \
#    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
#    && apt-get install -y git \

# Set root password (change 'password' to your desired password)
RUN echo 'root:mitlab' | chpasswd

# Permit root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port
EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 5432
EXPOSE 8000

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
