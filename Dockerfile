FROM cirrusci/flutter:3.7.0 AS build-env
RUN flutter doctor
RUN flutter config --enable-web
USER root
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter pub get
RUN flutter clean 
# RUN flutter gen-l10n
RUN flutter build web

FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
