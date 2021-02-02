FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache bash\
 build-base

RUN gem install bundler:2.1.4

WORKDIR /app

COPY Gemfile* ./
RUN bundle install --no-cache --retry 3 --jobs 4

COPY . .

CMD ["puma", "-e", "production", "-b", "tcp://0.0.0.0:8080"]
