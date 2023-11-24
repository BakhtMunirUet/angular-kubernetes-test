# stage one
FROM node:latest as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build 

# stage two
FROM nginx:alpine
COPY --from=build /usr/local/app/dist/angular-kubernetes-test /usr/share/nginx/html
EXPOSE 80