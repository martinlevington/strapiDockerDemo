FROM strapi/base

# ARG STRAPI_VERSION
RUN yarn global add strapi@3.0.0-beta.17.5
# RUN npm i strapi@3.0.0-beta.17.5 

ARG APP_NAME
ENV APP_NAME=${APP_NAME:-strapi-app}


WORKDIR /srv/app


COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .



# RUN yarn build

ENV NODE_ENV development
ENV DATABASE_CLIENT=sqlite
ENV DATABASE_NAME=strapi
ENV DATABASE_USERNAME=strapi
ENV DATABASE_PASSWORD=strapi


EXPOSE 1337


CMD yarn develop

