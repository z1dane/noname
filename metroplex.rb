require 'sinatra'
require 'yaml'
require 'logger'
require 'active_record'

class Metroplex < Sinatra::Application
  
  configure do
    Dir[File.join(settings.root, 'models', '*.rb')].each {|file| require file }

    db_settings = YAML.load_file(File.join(settings.root, 'config', 'database.yml'))[settings.environment.to_s]
    ActiveRecord::Base.establish_connection(db_settings)

    @metroplex_settings = YAML.load_file(File.join(settings.root, 'config', 'metroplex.yml'))[settings.environment.to_s]
    log_store = @metroplex_settings["log_store"] || File.join(File.dirname(__FILE__), 'log')
    @logger = Logger.new(File.join(log_store, "#{settings.environment.to_s}.log"))
    @logger.level = @metroplex_settings["log_level"] == "debug" ? Logger::DEBUG : Logger::INFO
  end

  configure :development, :test do
    enable :sessions
  end

  configure :production do
    use Rack::Session::Pool, :expire_after => 2592000
  end
    
  get '/' do
    "Welcome"
  end

  get '/create' do
    User.create(:login=>"test", :name=>"coolspot")
  end
end
