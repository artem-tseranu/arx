require_relative "switch_error"

module Arx
  class SwitchHandler
    def initialize(&declaration)
      instance_eval(&declaration)
    end

    def on(type, &handler)
      handlers[type] = handler
    end

    def call(type, data)
      handler = handlers[type]

      unless handler
        raise SwitchError.new(type, data)
      end

      handler.call(*data)
    end

    private

    def handlers
      @handlers ||= {}
    end
  end
end
