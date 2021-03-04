FROM ruby:2.6.5
RUN apt-get update -qq && \
            apt-get install -y \
            nodejs \
            vim \
            postgresql-client \
            yarn \
            chromium-driver \
            libpq-dev \
            build-essential

RUN mkdir /dic_issue_graduate
ENV APP_ROOT /dic_issue_graduate
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . $APP_ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
