FROM bitnami/moodle

# Install related packages and set LLVM 3.6 as the compiler
RUN apt-get -q update && \
    apt-get -q install -y \
    unzip python-pip libmysqlclient-dev libpq-dev python-dev git
RUN curl -L https://github.com/Civil-Service-Human-Resources/docker-moodle-scripts/archive/master.zip > docker-moodle-scripts.zip
RUN curl https://moodle.org/plugins/download.php/15169/logstore_xapi_moodle34_2017103001.zip > logstore_xapi_moodle34_2017103001.zip
RUN unzip logstore_xapi_moodle34_2017103001.zip -d opt/bitnami/moodle/admin/tool/log/store
RUN unzip docker-moodle-scripts.zip -d opt/bitnami/
RUN rm docker-moodle-scripts.zip && rm logstore_xapi_moodle34_2017103001.zip
