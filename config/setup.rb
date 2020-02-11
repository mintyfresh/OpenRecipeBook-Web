# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH << lib unless $LOAD_PATH.include?(lib)

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(:default)

require_relative 'application'
