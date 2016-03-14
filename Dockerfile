FROM quay.io/pires/docker-elasticsearch:2.2.0

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.2.0 --verbose \
  && /elasticsearch/bin/plugin install mobz/elasticsearch-head --verbose \
  && /elasticsearch/bin/plugin install royrusso/elasticsearch-HQ --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
