FROM python:3.6-alpine AS build
MAINTAINER BlueEnni

WORKDIR /files

#adding entrypointscript to the container
COPY entrypoint.sh ./

ARG url=https://github.com/Fenixin/Minecraft-Region-Fixer/archive/master.zip
ENV URL=$url

#Downloading tekxitserver.zip
RUN wget ${URL} \
#downloading unzip\
&& apk add unzip \
#unpacking the package\
&& unzip /files/master.zip \
&& mv Minecraft-Region-Fixer-master/* /files/ \
&& rm -rf Minecraft-Region-Fixer-master \
&& rm master.zip \
&& chmod +x /files/entrypoint.sh

FROM python:3.6-alpine AS runtime
COPY --from=build /files /files
RUN apk add --no-cache bash
WORKDIR /files

# Volumes for the external data (Server, World, Config...)
VOLUME "/data"

# Entrypoint
ENTRYPOINT /files/entrypoint.sh