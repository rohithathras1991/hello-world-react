FROM node:14.2.0 as codeimage
LABEL application: "react-app"
LABEL owner: "rohit"
RUN mkdir /code
WORKDIR	/code
COPY package*.json ./
RUN npm install
COPY . .
RUN yarn build


FROM nginx
COPY --from=codeimage /code/build/ /usr/share/nginx/html

