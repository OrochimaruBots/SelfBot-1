FROM buildpack-deps:buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  imagemagick \
  graphicsmagick \
  webp \
  mc && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN npm install -g npm@8.3.0
RUN npm install -g pm2
RUN npm update
COPY . .
RUN pm2 save
CMD ["pm2-runtime", "zeeone.js"]`