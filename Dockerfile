FROM ruby:3.0.1-slim
WORKDIR /app

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y git
RUN apt-get clean

ENV INPUT_FILE $INPUT_FILE
ENV OUTPUT_FILE $OUTPUT_FILE

COPY . .

RUN bundle install

CMD bundle exec thor openapi:watch
