require File.dirname(__FILE__) + '/spec_helper.rb'
require File.join(File.dirname(__FILE__), '..', 'metroplex.rb')

def app
  Metroplex.new
end

describe 'Metroplex' do
  include Rack::Test::Methods
  
  it 'should work' do 
    get '/'
    last_response.should be_ok
  end

end
