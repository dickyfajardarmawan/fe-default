# FROM node:14 as builder
# Set the working directory to /app inside the container
# WORKDIR /src
# Copy app files
# COPY package.json ./
# COPY . .
# RUN npm cache verify
# RUN npm install
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
# Start the app
# RUN npm run start
# CMD ["npm", "start"]

# FROM node:latest as builder
# WORKDIR /src
# COPY package.json ./
# RUN npm install --legacy-peer-deps
# COPY . .

# Build the app
# RUN npm run build

# FROM nginx:latest

# COPY nginx.conf /etc/nginx/conf.d/default.conf

# COPY --from=builder ./src/dist /usr/share/nginx/html

# Bundle static assets with nginx
# FROM nginx:1.21.0-alpine as production
# ENV NODE_ENV production
# Copy built assets from `builder` image
# COPY /dist /usr/share/nginx/html
# Add your nginx.conf
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose port
# EXPOSE 3002
# Start nginx
# CMD ["nginx", "-g", "daemon off;"]

# FROM node:latest
# WORKDIR /src
# COPY package.json ./
# COPY ../apiConfig.json ../
# RUN npm install --legacy-peer-deps
# COPY . .
# CMD ["npm", "start"]

# FROM node:latest
# WORKDIR RolesManagement/src
# COPY apiConfig.json ./
# COPY RolesManagement/package.json ./
# COPY ./RolesManagement .
# RUN npm install --legacy-peer-deps
# CMD ["npm", "start"]

FROM node:16-alpine as builder
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY . .
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm install --legacy-peer-deps 
# Build the app
RUN npm run build

# Bundle static assets with nginx
FROM nginx:alpine as production
ENV NODE_ENV production
# Copy built assets from `builder` image
COPY --from=builder /app/dist /usr/share/nginx/html
# Add your nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
# Expose port
EXPOSE 80
RUN chown nginx.nginx /usr/share/nginx/html/ -R
# Start nginx
CMD ["nginx", "-g", "daemon off;"]