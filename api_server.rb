require 'sinatra'
require 'redis'
require 'json'

set :server, :thin

get '/test_page' do
  erb :test_page
end

post '/armstrong_push' do
  if !params[:channel].nil?
    $__redis__ ||= Redis.new
    $__redis__.publish(params[:channel], request.body.read)

    status 200
    content_type :json
    JSON.generate({ status: 'success' })
  else
    status 400
    content_type :json
    JSON.generate({ status: 'failed' })
  end
end
