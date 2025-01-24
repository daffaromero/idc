FROM confluentinc/cp-kafka-connect:7.8.0

ENV CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"
COPY ./local/connect-distributed.properties /etc/kafka/connect-distributed.properties
EXPOSE 8083/tcp

RUN confluent-hub install debezium/debezium-connector-postgresql:latest --no-prompt --verbose
ENTRYPOINT [ "/bin/connect-distributed", "/etc/kafka/connect-distributed.properties" ]