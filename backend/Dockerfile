FROM ruby:3.3.0

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  curl \
  git \
  build-essential \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libyaml-dev \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libgmp-dev \
  autoconf \
  bison \
  libtool \
  rustc \
  cargo && \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
  gem install bundler && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.cargo/bin:${PATH}" \
    LANG=C.UTF-8 \
    APP_ROOT=/app

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY ./Gemfile ./Gemfile.lock $APP_ROOT/
RUN bundle install --jobs 4 --retry 3

RUN echo "source /root/.aliases" >> /root/.bashrc

COPY . $APP_ROOT

EXPOSE 3000
