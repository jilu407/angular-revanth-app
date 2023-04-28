FROM node AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN ls dist/revanth-app/


#stage 2

FROM httpd
COPY --from=build /app/dist/revanth-app/ /usr/local/apache2/htdocs/