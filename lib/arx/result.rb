require_relative "switch_handler"

module Arx
  class Result
    def initialize(type, *data)
      @type = type
      @data = data
    end

    def switch(&declaration)
      handler = SwitchHandler.new(&declaration)
      handler.call(type, data)
    end

    private

    attr_reader :type
    attr_reader :data
  end
end
