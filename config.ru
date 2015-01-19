#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

Sprockets.append_path('/dictionaries/')
require 'resque/server'

run Rack::URLMap.new \
  "/"       => Padrino.application,
  "/resque" => Resque::Server.new,
  "/assets" => Padrino::Assets.environment

