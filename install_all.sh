# install all

# Устанавливаем необходимые пакеты
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential autoconf libtool pkg-config gcc g++ cmake git libssl-dev zlib1g-dev librdkafka-dev mysql-server mysql-client libmysqlclient-dev libboost-all-dev openjdk-8-jdk openjdk-8-jre default-jdk docker docker-compose
 
# Конфигурируем Docker
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
 
# Устанавливаем Google Test
sudo apt-get install libgtest-dev
cd /usr/src/gtest/
sudo cmake -DBUILD_SHARED_LIBS=ON
sudo make
sudo cp lib/*.so /usr/lib
cd
 
# Устанавливаем библиотеку Poco
git clone -b poco-1.11.7-release https://github.com/pocoproject/poco.git
cd poco
mkdir cmake-build
cd cmake-build
cmake ..
cmake --build . --config Release
sudo cmake --build . --target install
cd
 
# Устанавливаем библиотеки для RabbitMQ/AMQP
git clone https://github.com/CopernicaMarketingSoftware/AMQP-CPP.git
cd AMQP-CPP
make
sudo make install
cd
 
# Устанавливаем библиотеки для работы с Kafka
git clone https://github.com/edenhill/librdkafka.git
cd librdkafka
./configure
make
sudo make install
cd 
 
git clone https://github.com/mfontanini/cppkafka
cd cppkafka
mkdir build 
cd build 
cmake ..
make 
sudo make install
cd 
  
# Устанавливаем библиотеку для работы с REDIS
git clone https://github.com/tdv/redis-cpp.git
cd redis-cpp
mkdir build 
cd build 
cmake .. 
make 
sudo make install
cd 

# Устанавливаем wrk
sudo apt-get install -y wrk
