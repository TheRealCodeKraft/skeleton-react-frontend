FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
  curl 

RUN curl -sSo /usr/local/bin/n https://raw.githubusercontent.com/visionmedia/n/master/bin/n
RUN chmod +x /usr/local/bin/n
RUN n stable

RUN mkdir -p /app
WORKDIR /app

COPY package.json ./
RUN npm install

CMD ["npm", "start"]
