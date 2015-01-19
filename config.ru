#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

map '/assets' do
  run Padrino::Assets.environment
end
Sprockets.append_path('/dictionaries/')

# Load sidekiq web interface
require 'sidekiq/web'
map('/sidekiq') { run Sidekiq::Web }


run Padrino.application
