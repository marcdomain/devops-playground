#!bin/bash

echo_statement() {
  echo -e "\033[0;35m >>>>>>>>> ${1} >>>>>>>>> \033[0m"
}

create_network() {
  echo_statement "Creating Network"
  docker network create -d bridge marcdomain
  echo ""
}

create_mysql_image() {
  echo_statement "Creating MYSQL image"
  docker build -t marc_mysql_image ./mysql
  echo ""
}

create_nginx_image() {
  echo_statement "Creating NGINX image"
  docker build -t marc_nginx_image ./nginx
  echo ""
}

create_kibana_image() {
  echo_statement "Pulling KIBANA image"
  docker pull kibana:6.4.2
  echo ""
}

create_nginx_container() {
  echo_statement "Creating NGINX container"
  docker run -d -p 8030:80 --network="marcdomain" --name marc_server marc_nginx_image
  echo ""
}

create_mysql_container() {
  echo_statement "Creating MYSQL container"
  docker run -d -p 3306:3306 --network="marcdomain" --name marc_mysql_database marc_mysql_image
  echo ""
}

create_kibana_container() {
  echo_statement "Creating KIBANA container"
  docker run -d -p 5601:5601 --network="marcdomain" --name marc_kibana kibana:6.4.2
  echo ""
}

main() {
  create_network
  create_mysql_image
  create_nginx_image
  create_kibana_image
  create_nginx_container
  create_mysql_container
  create_kibana_container
}

main
