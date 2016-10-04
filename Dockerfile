FROM ruby:2.3.0
MAINTAINER Vincent Coste <coste.vincent@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev


ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# sym link nodejs to node
RUN ln -s /usr/bin/nodejs /usr/bin/node

# handle ruby dependencies
RUN gem install bundler
ADD Gemfile* $APP_HOME/
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=5 \
  BUNDLE_PATH=/bundle
# ENV BUNDLE_PATH /bundle
RUN bundle check || bundle install
# RUN bundle install

ADD . $APP_HOME
