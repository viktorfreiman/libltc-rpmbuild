# Complete devcontainer for working and testing
FROM centos:8

# use non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# https://github.com/microsoft/vscode-dev-containers/blob/master/script-library/docs/common.md
COPY library-scripts/common-redhat.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/common-redhat.sh

# start by doing a update
RUN dnf update -y

# Get python3 for scripts
RUN dnf install -y python38

# reset bashrc to default
RUN rm /home/$USERNAME/.bashrc
RUN cp /etc/skel/.bashrc /home/$USERNAME/.bashrc

# Good to have alias
RUN echo "alias p='python3'" >> /home/$USERNAME/.bashrc
RUN echo "alias l='ls -alh'" >> /home/$USERNAME/.bashrc

# Install docker in devcontainer
COPY library-scripts/docker-redhat.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/docker-redhat.sh
ENTRYPOINT ["/usr/local/share/docker-init.sh"]
CMD ["sleep", "infinity"]