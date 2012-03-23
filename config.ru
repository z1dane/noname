require File.dirname(__FILE__) + '/board.rb'
use Rack::ShowExceptions
run Board.new
