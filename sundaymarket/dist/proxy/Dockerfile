FROM ubuntu:20.04

# Install required packages
RUN apt update -y && apt upgrade -y
RUN apt install -y debian-keyring debian-archive-keyring apt-transport-https curl sudo python3 tcpdump
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt update
RUN apt install caddy






# Copy Caddy configuration file
COPY Caddyfile /etc/caddy/Caddyfile

# Copy entrypoint.sh script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY sync.py /sync.py
RUN mkdir /tmp/pcaps
RUN chmod a+w /tmp/pcaps

# Set the entrypoint script as the container's entrypoint
ENTRYPOINT ["/entrypoint.sh"]
