FROM ruby:2.7.1-slim

WORKDIR /opt/oniwa

RUN apt update && \
    apt install -y --no-install-recommends \
      default-libmysqlclient-dev \
      gcc \
      make \
      patch

COPY Gemfile Gemfile.lock ./
RUN bundle install
