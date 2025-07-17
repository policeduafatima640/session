FROM node:lts-buster

# Install required packages without upgrade to avoid errors
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  libwebp-dev \
  libwebp-tools && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Copy and install dependencies
COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2

# Copy the rest of your application code
COPY . .

EXPOSE 5000

CMD ["npm", "start"]
