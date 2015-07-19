task default: %w(apollo:start)


namespace :apollo do
  desc "Start both Websocket Server and Sinatra"
  multitask start: ["launch", "test_page"]

  desc "Start Apollo Websocket Server"
  task :launch do
    ruby "app/em_server.rb"
  end

  desc "Start Sinatra for test page in development mode"
  task :test_page do
    ruby "test_page.rb"
  end
end
