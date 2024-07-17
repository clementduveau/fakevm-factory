FROM ubuntu:latest
RUN apt-get update && apt-get install -y systemd systemd-sysv openssh-server sudo ttyd curl vim
RUN useradd -m -s /bin/bash engineer && echo "engineer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/engineer
RUN systemctl enable ssh
COPY ttyd.service /etc/systemd/system/
RUN systemctl enable ttyd.service
STOPSIGNAL SIGRTMIN+3
ENTRYPOINT ["/lib/systemd/systemd"]