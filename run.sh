#!/bin/bash
CONSUMER="weatherData"

KAFKA="kafka_2.11-0.10.2.0"
ELASTIC="elasticsearch-5.4.1"

cd "pipline";
echo "start Elasticsearch";
cd "$ELASTIC";
./bin/elasticsearch >>/dev/null 2>>/dev/null &
cd ..;


sleep 5;
cd "$KAFKA";

echo "start zookeeper"
bin/zookeeper-server-start.sh config/zookeeper.properties >>/dev/null 2>>/dev/null &
sleep 5;
echo "start kafka"
bin/kafka-server-start.sh config/server.properties >>/dev/null 2>>/dev/null &
#$KAFKA/bin/kafka-server-start.sh config/server.properties
echo "start consumer"
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $CONSUMER

