FROM ubuntu:18.04

MAINTAINER victomartin@gmail.com
ARG COD2_USR_PASSWORD
ENV COD2_USR_USERNAME=cod2server \
    COD2_SETUP_SCRIPT=linuxgsm.sh
ENV COD2_USR_HOMEDIR=/home/$COD2_USR_USERNAME

# Install dependencies, prepare environment and download setup script
RUN dpkg --add-architecture i386 \
    && apt update \
    && apt install --no-install-recommends -y \
      mc \
      nano \
      htop \
      slurm \
      ncdu \
      mailutils \
      postfix \
      curl \
      wget \
      file \
      bzip2 \
      gzip \
      unzip \
      bsdmainutils \
      python \
      util-linux \
      ca-certificates \
      binutils \
      bc \
      jq \
      tmux \
      lib32gcc1 \
      libstdc++6 \
      libstdc++6:i386 \
      libstdc++5:i386 \
    && adduser $COD2_USR_USERNAME \
      --gecos "COD SERVER,666,WorkPhone,HomePhone" \
      --disabled-password \
    && echo "$COD2_USR_USERNAME:$COD2_USR_PASSWORD" | chpasswd

COPY ["docker-entrypoint.sh", "$COD2_USR_HOMEDIR/docker-entrypoint.sh"]
RUN chmod +x "$COD2_USR_HOMEDIR/docker-entrypoint.sh"
USER $COD2_USR_USERNAME
WORKDIR $COD2_USR_HOMEDIR

# Create server user
# Install server
RUN wget -O $COD2_SETUP_SCRIPT https://linuxgsm.sh \
    && chmod +x $COD2_SETUP_SCRIPT \
    && bash $COD2_SETUP_SCRIPT $COD2_USR_USERNAME \
    && echo "y\ny\n" | ./cod2server install

ENTRYPOINT ["./docker-entrypoint.sh"]
