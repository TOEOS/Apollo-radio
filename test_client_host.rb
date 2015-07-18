require 'sinatra'

set :server, :thin

get '/' do
  erb :test_page
end
