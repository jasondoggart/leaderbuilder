require 'sinatra/base'

class FakePlanningCenter < Sinatra::Base
  get 'people/v2/people' do
    json_response 200, 'people.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
