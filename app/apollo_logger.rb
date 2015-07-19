class ApolloLogger
  def initialize(*args)
    @logger = Logger.new(*args)
  end

  def log(level, msg)
    @logger.send(level, "[WEBSOCKET]: #{msg}")
  end
end
