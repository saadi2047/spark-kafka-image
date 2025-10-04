# Use base Spark image (Java + Python)
FROM apache/spark:4.0.0-java21-python3

# Set working directory
WORKDIR /opt/spark/work-dir

# (Optional) Copy custom jars or config files
# COPY jars/* /opt/spark/jars/
# COPY conf/* /opt/spark/conf/

# Install auxiliary tools (if needed)
USER root
RUN apt-get update && apt-get install -y curl wget nano vim && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV SPARK_HOME=/opt/spark
ENV PATH="$SPARK_HOME/bin:$PATH"

# Switch back to default user (if your base uses non-root for Spark processes)
USER root

# Default command (entrypoint of Spark image)
CMD ["/opt/entrypoint.sh"]
