# Dockerfile for the Rithm fullstack bootcamp setup
# Created and maintained by joel@joelburton.com

FROM ubuntu

RUN apt -y update && apt -y upgrade
RUN yes | unminimize

# Need to install now, so we can prevent it from pop-up-asking-for-timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tzdata

RUN apt-get -y install \
  build-essential less nano curl zip man info vim sntp procps sudo lsof netcat \
  zsh git wamerican tree httpie fd-find psmisc neofetch micro bat gh

RUN apt-get -y install python3 python3-venv python3-dev ipython3 python3-autopep8

RUN apt-get -y install postgresql postgresql-client-common libpq-dev
RUN \
  service postgresql start && \
  echo password | sudo -Su postgres sh -c "createuser -s user && createdb user"

# Need specific and more modern version of Node than Ubuntu ships with
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash -
RUN apt-get -y install nodejs
RUN npm -g install nodemon jest vite vitest

# Create user "user" with password "password" and allow them to use sudo
RUN useradd user -m -s /usr/bin/zsh -G sudo && echo user:password | chpasswd
USER user
WORKDIR /home/user

RUN curl -s https://rithm-setup.s3.amazonaws.com/zshell-setup.sh | bash -
RUN curl -s https://rithm-setup.s3.amazonaws.com/git-setup.sh | bash -
# Add username & hostname to start of prompt
RUN echo PROMPT=\"%F{red}%n@%m%f \$PROMPT\" >> /home/user/.zprompt.zsh
RUN mkdir /home/user/rithm /home/user/rithm/lectures \
  /home/user/rithm/exercises /home/user/rithm/projects
ENTRYPOINT ["zsh"]
