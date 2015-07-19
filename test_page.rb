require 'sinatra'

set :server, :thin

get '/test_page' do
  erb :test_page
end
