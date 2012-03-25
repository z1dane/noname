require File.dirname(__FILE__) + '/spec_helper.rb'
require File.join(File.dirname(__FILE__), '..', 'metroplex.rb')

def app
  Metroplex.new
end

describe 'Metroplex' do
  include Rack::Test::Methods
  
  it 'should return content of index.html' do 
    get '/'
    File.open(File.join(settings.root, 'public', 'index.html')) do |file|
      last_response.should equal file.read
    end
  end

  describe 'in actions with sessions' do  

    it 'should authenticate users' do
      post '/login'
      last_response.should be_ok
    end

    context 'when user unauthenticated' do

      before do
        User.create valid_user
        session[:user_id] = nil
      end
      
      it 'should not starts a session when login is incorrect' do
        post '/login', :login => "invalid", :password => "user"
        session[:user_id].should be_nil
      end

      it 'should not starts a session when password is incorrect' do
        post '/login', :login => "user", :password => "123"
        session[:user_id].should be_nil
      end

      it 'should start session when login and password is correct' do
        post '/login', :login => "user", :password => "user"
        session[:user_id].sould_not be_nil
      end
      
    end

    context 'when user authenticated' do

      before do
        @user = User.create valid_user
        @user.authenticate
      end

      it 'should be authenticated' do
        session[:user_id].should_not be_nil
      end

      it 'should be able to log out' do
        get '/logout'
        session[:user_id].should be_nil
      end
      
    end
    
  end
  
end
