FROM ruby:2.6.5

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

RUN gem install bundler -v 1.17.3

# Install gems, nodejs and precompile the assets
RUN bundle install \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

# Start the application server
ENTRYPOINT ./entrypoint.sh
