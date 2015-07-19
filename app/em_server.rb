require 'em-websocket'
require 'em-hiredis'
require 'json'
require 'logger'
require 'cgi'
require_relative 'apollo_logger'
require_relative 'consumer'

EM.run do
  @logger = ApolloLogger.new(STDOUT)

  EM::WebSocket.run(host: "0.0.0.0", port: 20232) do |ws|
    ws.onopen do |handshake|
      @consumer = Consumer.new(handshake)
      ws.send "Hello Client, you connected to #{@consumer.channel}"
      @consumer.subscribe
      @consumer.on :message do |channel, message|
        ws.send "channel: #{channel}, message: #{message}"
      end
    end

    ws.onmessage do |message|
      data = JSON.parse(message)
      EM::Hiredis.connect.pubsub.publish(data['channel'], data['msg'])
    end

    ws.onclose do
      @logger.log(
        :debug,
        'onclose'
      )
    end
  end
end
