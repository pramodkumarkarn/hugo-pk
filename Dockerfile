#need an extended image for CSS processing
FROM klakegg/hugo:ext-alpine

#sass
RUN apk add --update bash nodejs nodejs-npm
