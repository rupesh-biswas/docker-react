FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Below expose line is information for other developers the actual port mapping is picked up by docker-compose.yml file.
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html