task default: %w(apollo:start)

namespace :apollo do
  desc "Start both Websocket Server and Sinatra"
  multitask start: ["ws_server", "api_server"]

  desc "Start Apollo Websocket Server"
  task :ws_server do
    ruby "app/ws_server.rb"
  end

  desc "Start Sinatra for test page in development mode"
  task :api_server do
    ruby "api_server.rb"
  end
end
