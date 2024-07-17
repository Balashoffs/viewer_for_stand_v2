FROM nginx:1.25.3-alpine

#пока ручной перенос файлов из вьюера в папку собранную флаттером
COPY . /usr/share/nginx/html