FROM apache/spark:4.0.0-java21-python3

WORKDIR /opt/spark/work-dir

USER root
RUN apt-get update && apt-get install -y curl wget nano vim && rm -rf /var/lib/apt/lists/*

ENV SPARK_HOME=/opt/spark
ENV PATH="$SPARK_HOME/bin:$PATH"

CMD ["/opt/entrypoint.sh"]
