FROM ruby:3.0.1

WORKDIR /app

EXPOSE 3000

RUN gem install rails bundler
RUN gem install rails

ENV RAILS_ENV development

RUN git clone https://github.com/ViralOne/FreaksCatalog-API.git
WORKDIR FreaksCatalog-API
RUN cd ./
RUN bundle install
ONBUILD rails db:setup
CMD ["rails", "server", "-b", "0.0.0.0"]
