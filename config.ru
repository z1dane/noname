require File.dirname(__FILE__) + '/metroplex.rb'
use Rack::ShowExceptions
run Metroplex.new
