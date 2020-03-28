# dockerfile
# start of phase 1
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "build"]

# start of phase 2
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
 
