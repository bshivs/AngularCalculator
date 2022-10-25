# select base image
FROM node:14-alpine AS build-step

# Install Angular
RUN npm install -g @angular/cli

# Create Direcory for app
RUN mkdir /app

# Set app dir for running comands
WORKDIR /app

# get app code 
COPY . /app

# Start build
RUN npm install
RUN ng build

# select base image
FROM httpd

# copy dist/cal to /usr/local/apache2/htdocs/
 
COPY --from=build-step /app/dist/angularCalc /usr/local/apache2/htdocs/
