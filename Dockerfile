FROM python:3-slim

VOLUME /src

RUN apt-get update && \
  apt-get install -y libxml2-dev libxslt-dev lib32z1-dev python-lxml libmagic-dev libjpeg-dev git-all curl
  
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -

RUN pip install git+https://www.github.com/splunk/eventgen.git

WORKDIR /src

# Default is to run ALL apps in the /src mount with precert mode
CMD splunk_eventgen --version
