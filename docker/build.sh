docker build -t  "msdemo-db" ./mysql
docker build -t  eap6 ./eap6-base
docker build -t "msdemo-product" ./product
docker build -t "msdemo-sales" ./sales
docker build -t "msdemo-billing" ./billing
docker build -t "msdemo-frontend" ./frontend

