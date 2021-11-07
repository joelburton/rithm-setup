FROM ubuntu
RUN apt -y update && apt -y upgrade
RUN yes | unminimize
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tzdata sudo zsh
RUN apt-get -y install build-essential less nano curl zip man info vim fd-find procps
RUN apt-get -y install python3 python3-venv python3-dev ipython3 flake8
RUN apt-get -y install postgresql libpq-dev  
RUN service postgresql start && echo password | sudo -Su postgres createuser -s user && sudo -Su postgres createdb user
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y install nodejs
RUN npm -g install nodemon
RUN apt-get -y install git
RUN apt-get -y install tree
RUN apt-get -y install httpie
RUN npm -g install heroku
RUN useradd user -m -s /usr/bin/zsh -G sudo && echo "user:password" | chpasswd
USER user
COPY files/zshrc /home/user/.zshrc
RUN git config --global --add core.excludesfile ~/.gitignore_global && \
  git config --global --add credential.helper store && \
  git config --global init.defaultBranch main && \
  git config --global pull.rebase false
COPY files/gitignore_global /home/user/.gitignore_global
WORKDIR /home/user
ENTRYPOINT ["zsh"]
