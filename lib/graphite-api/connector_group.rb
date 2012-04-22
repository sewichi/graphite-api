module GraphiteAPI
  class ConnectorGroup

    attr_reader :options, :connectors

    def initialize options
      @options = options
      @connectors = options[:backends].map { |o| Connector.new(*o) }
    end

    def publish messages
      Logger.debug [:connector_group,:publish,messages.size, @connectors]
      Array(messages).each { |msg| connectors.map {|c| c.puts msg} }
    end
    
  end
end
