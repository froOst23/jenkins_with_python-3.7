FROM jenkins/jenkins:lts
USER root
RUN apt-get update \
&& apt-get install -y build-essential checkinstall \
&& apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
&& cd /usr/src \
&& wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz \
&& tar xzf Python-3.7.4.tgz \
&& cd Python-3.7.4 \
&& ./configure --enable-optimizations \
&& make altinstall \
&& curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
&& python get-pip.py \
&& pip3.7 install --upgrade pip \
&& pip3.7 -V \
&& python3.7 -V
USER jenkins
