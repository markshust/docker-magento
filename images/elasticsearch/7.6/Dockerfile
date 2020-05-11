FROM elasticsearch:7.6.2

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic

COPY ./conf/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
