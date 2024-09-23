#!/bin/bash

set -e

echo 'Building Docker containers...'
docker compose build
compose_cmd='docker compose run --rm backend'

rails_setup() {
  echo 'Rails setup started...'
  $compose_cmd bundle install
  $compose_cmd bin/rails db:create
  $compose_cmd bin/rails db:migrate
  $compose_cmd bin/rails db:seed
  echo 'Rails setup completed!'
}

rails_setup

echo 'Starting Docker Compose services...'
docker compose up -d
