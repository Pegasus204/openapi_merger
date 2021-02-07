FROM ruby:2.7.2-slim
WORKDIR /app

ENV INPUT_FILE $INPUT_FILE
ENV OUTPUT_FILE $OUTPUT_FILE

COPY . .

RUN bundle install

CMD bundle exec thor openapi:watch
