require 'sinatra'
require 'redis'
set :server, :thin

get '/test_page' do
  erb :test_page
end

post '/armstrong_push' do
  if !params[:channel].nil?
    $__redis__ ||= Redis.new
    puts request.body.class
    $__redis__.publish(params[:channel], request.body.read)
  end
end
