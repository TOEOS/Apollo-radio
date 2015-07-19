class Consumer
  attr_reader :connection, :pubsub, :ws_handshake
  
  def initialize(ws_handshake)
    @ws_handshake = ws_handshake
  end

  def subscribe
    @connection = EM::Hiredis.connect
    @pubsub = @connection.pubsub
    @pubsub.subscribe(channel)
  end

  def publish(msg)
    unless connection
      warn %Q(didn't subscribe yet, auto subscribe.)
      subscribe
    end

    connection.publish(channel, msg)
  end

  def on(state, &block)
    pubsub.on(state) do |channel, msg|
      block.call(channel, msg)
    end
  end

  def channel
    @channel ||= CGI::parse(ws_handshake.query_string)['channel'].first
  end
end
