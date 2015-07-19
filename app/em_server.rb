require 'em-websocket'
require 'em-hiredis'
require 'json'
require 'logger'

EM.run do
  @log = Logger.new(STDOUT)

  EM::WebSocket.run(:host => "0.0.0.0", :port => 20232) do |ws|
    ws.onopen do |handshake|
      ws.send "Hello Client, you connected to #{handshake.path}"

      @redis = EM::Hiredis.connect
      pubsub = @redis.pubsub
      pubsub.subscribe 'apollo'
      pubsub.on(:message) do |channel, message|
        # log
        @log.debug "redis pubsub.on(:message); channel: #{channel}; message: #{message}"

        ws.send "channel: #{channel}, message: #{message}"
      end
    end

    ws.onmessage do |msg|
      @redis.publish 'apollo', msg
    end

    ws.onclose do
      @log.debug 'onclose'
    end
  end
end
