FROM elasticsearch:6.8.8

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic

COPY ./conf/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
