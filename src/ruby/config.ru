# Encoding: utf-8
Encoding.default_internal = Encoding::UTF_8
require 'bundler/setup'

require File.join(File.dirname(__FILE__), 'app/tchoupi-app')
run Api::Base
