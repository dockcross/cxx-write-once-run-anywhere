FROM jupyter/base-notebook:6939ea1b1df3
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

USER root

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates && \
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
    --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
  echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > \
    /etc/apt/sources.list.d/docker.list && \
  apt-get update && \
  sudo apt-get install -y docker-engine && \
  gpasswd -a ${NB_USER} docker

USER $NB_USER

RUN conda install --yes --quiet -c damianavila82 rise

RUN pip install bash_kernel && \
  python -m bash_kernel.install
