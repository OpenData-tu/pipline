KAFKA="kafka_2.11-0.10.2.0"
ELASTIC="elasticsearch-5.4.1"


mkdir "pipline";
cd "pipline";
git clone  git@github.com:OpenData-tu/WeatherDataImporter.git;
cd "WeatherDataImporter";
mvn install;
cd ..;

git clone  git@github.com:OpenData-tu/kafkaToElasticsearchConsumer.git;
cd "kafkaToElasticsearchConsumer";
mvn install;
cd ..;


if [ ! -d "$KAFKA" ]; then
	wget -nc "http://mirror.yannic-bonenberger.com/apache/kafka/0.10.2.0/kafka_2.11-0.10.2.0.tgz";
	tar -xzf $KAFKA.tgz;
	rm $KAFKA.tgz
else
	echo "kafka already there";
fi

if [ ! -d "$ELASTIC" ]; then
	wget https://artifacts.elastic.co/downloads/elasticsearch/$ELASTIC.tar.gz;
	tar -xzf $ELASTIC.tar.gz;
	rm $ELASTIC.tgz
else
	echo "elastic already there";
fi

