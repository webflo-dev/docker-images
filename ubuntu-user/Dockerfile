FROM ubuntu:latest

ARG username=abc

RUN \
    apt -y update && \
    apt -y upgrade && \
    apt -y autoremove && \
    apt -y install sudo zsh git curl

RUN useradd -U -m ${username} && \
    usermod -aG sudo -s /bin/zsh ${username} && \
    echo "${username} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${username} && \
    chmod 0440 /etc/sudoers.d/${username} && \
    echo "Set disable_coredump false" >> /etc/sudo.conf && \
    touch /home/${username}/.zshrc && \
    chown ${username}:${username} /home/${username}/.zshrc

USER ${username}
WORKDIR /home/${username}

