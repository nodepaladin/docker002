FROM keymetrics/pm2:latest-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY pm2.json ./
ENV NPM_CONFIG_LOGLEVEL warn
RUN yarn
RUN ls -al -R
#CMD [ "pm2-runtime", "start", "pm2.json" ]
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .
EXPOSE 8080
CMD [ "pm2-runtime", "start", "pm2.json" ]
