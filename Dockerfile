FROM --platform=linux/amd64 ubuntu:20.04
ENV CGO_ENABLED 0

# update
RUN apt-get update -y \ 
    && apt-get install vim curl git -y \
    && apt upgrade -y

# install necessary libraries.
RUN apt install -y strace sysstat psmisc

############
# go lang
############
RUN curl -s https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz| tar -v -C /usr/local -xz
ENV PATH $PATH:/usr/local/go/bin


############
# python
############
RUN apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y

# conclusion
WORKDIR /workspace
ENTRYPOINT ["tail", "-f", "/dev/null"]
