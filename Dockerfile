FROM node:10
ARG HTTP_PROXY
ARG HTTPS_PROXY

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY

RUN npm config set proxy $HTTP_PROXY && \
    npm config set https-proxy $HTTPS_PROXY && \
    npm config set strict-ssl false

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]
