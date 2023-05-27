FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD [ "node", "server.js" ]

#command to run container
#docker run -d -p 3000:80 --name feedback-app -v feedback:/app/feedback feedback-image
#-d, for de-attach mode --name <name of container> -v, attaching volume 

#bind volume
#path shortcut for attaching bind mount, -v "%cd%":/app

#bind path 
#docker run -d -p 3000:80 --name feedback-app -v feedback:/app/feedback -v 
#"C:\Users\fballon\Documents\dxc-work\docker\section3-volumes\data-volumes-03-adj-node-code:/app" -v /app/node_modules feedback-image
