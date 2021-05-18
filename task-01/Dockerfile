#FROM amazonlinux:2
FROM centos:7

LABEL maintainer.0="Charles Waktins (@chris17453)"

# update
RUN yum update -y

# install deps (al2 & centos7 need this)
RUN yum install make -y

# install deps (al2 needs this)
RUN yum install tar gzip shadow-utils -y

# install gosu with verification (coipy pasta from -> https://gist.github.com/decayofmind/58a61c976ad9ffe06890)
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

# Create app working directory
RUN mkdir -p /opt

# Set curent working directory for app
WORKDIR /opt

# SET ENV Vars
ENV LITECOIN_DATA=/home/litecoin/.litecoin
ENV LITECOIN_APP_DIR=/opt/litecoin-0.18.1
ENV LITECOIN_VERSION=0.18.1

#copy makefile into working directoryt
COPY Makefile /opt

#copy makefile into working directoryt
COPY docker-entrypoint.sh /opt/entrypoint.sh

# run makes build command
# - downlaods the litecoin binary
# - imports litecoin pub gpg signature
# - verifys gpg sig
# - verifys checksum of binary in gpg sig
RUN make install

#create litecoin user
RUN adduser litecoin 

# Create user config /data store directory
RUN mkdir -p /home/litecoin/.litecoin

# if you want to use an external data store
VOLUME ["/home/litecoin/.litecoin"]

# run everything after this as the litecoin user
#USER litecoin

# Remove unneded deps 
RUN yum remove make -y

# remove deps (al2 needs this) pas even if fails (testing in centos7)
RUN yum remove tar gzip shadow-utils -y | true


# Exposing the internal container litecoind ports as found in repo -> https://github.com/uphold/docker-litecoin-core
# Mainnet JSON-RPC/REST   9332   
# Mainnet P2P             9333   
# Testnet JSON-RPC        19332  
# Testnet P2P             19333  
# Regtest JSON-RPC/REST   19444  
# Regtest P2P             19332  

EXPOSE 9332 9333 19332 19333 19444

ENTRYPOINT [ "/opt/entrypoint.sh"]

CMD ["litecoind"]
