FROM --platform=linux/amd64 ubuntu:20.04
ENV CGO_ENABLED 0

RUN apt-get update -y \ 
    && apt-get install vim curl git -y \
    && apt upgrade -y

######
# go lang
####
# ENV ARCH amd64
# ENV GOVERSION 1.7.5
# ENV HOME /root
# ENV PATH $PATH:/usr/local/go/bin
# ENV GOPATH $HOME/work

# RUN apt-get update -y \
#     && apt-get install vim curl git -y \
#     && cd /tmp \
#     && curl -OL https://golang.org/dl/go${GOVERSION}.linux-${ARCH}.tar.gz \
#     && tar -C /usr/local -xvf go${GOVERSION}.linux-${ARCH}.tar.gz

# RUN apt install golang-go -y


RUN curl -s https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz| tar -v -C /usr/local -xz
ENV PATH $PATH:/usr/local/go/bin


### 
# python
###snap install go --classic

# ENV PYTHONVERSION 3.11.0

# RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget \
#     && cd /tmp \
#     curl -OL https://www.python.org/ftp/python/${PYTHONVERSION}/Python-${PYTHONVERSION}a7.tgz \
#     tar -xvf Python-${PYTHONVERSION}a7.tgz \
#     cd Python-${PYTHONVERSION}a7 \
#    ./configure --enable-optimizations \
#     make install \
#     python3 -m pip --version 

# RUN apt install software-properties-common -y \
#     add-apt-repository ppa:deadsnakes/ppa \
#     apt update -y \
#     apt install python3 -y
RUN apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y

WORKDIR /workspace
ENTRYPOINT ["tail", "-f", "/dev/null"]
