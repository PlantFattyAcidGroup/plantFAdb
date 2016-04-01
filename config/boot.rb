ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['NLS_LANG'] ||= 'AMERICAN_AMERICA.AL32UTF8'
require 'bundler/setup' # Set up gems listed in the Gemfile.
