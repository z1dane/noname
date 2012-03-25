require 'sinatra'
require 'rack/test'

set :environment, :test
set :run, false
set :raise_errors, true
set :root, File.join(File.dirname(__FILE__), "..")

