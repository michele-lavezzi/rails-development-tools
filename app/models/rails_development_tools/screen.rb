require 'singleton'

module RailsDevelopmentTools
  class Screen
    include Singleton

    singleton_class.send(:alias_method, :logger, :instance)

    @@message =[]

    def clear
      @@message.clear
    end

    def write(message)
      @@message << message
    end

    def messages
      @@message
    end
  end
end