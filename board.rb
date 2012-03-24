require 'sinatra'
require 'yaml'

class Board < Sinatra::Application
  
  def initialize(*args)
    require File.join(File.dirname('__FILE__'), 'config', 'database.rb')
    Dir[File.join(File.dirname('__FILE__'), 'models', '*.rb')].each {|file| require file }

    super(*args)
  end  

  get '/' do
    "Welcome to NU PaaS adapter"
  end

  get '/create' do
    User.create(:login=>"test", :name=>"coolspot")
  end
end
