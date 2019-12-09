FROM node:latest AS builder
COPY . ./assistant-front
WORKDIR /assistant-front
RUN npm i
RUN $(npm bin)/ng build --prod

FROM nginx:latest
COPY --from=builder /assistant-front/dist/assistant-front/ /usr/share/nginx/html