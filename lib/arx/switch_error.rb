module Arx
  class SwitchError < StandardError
    def initialize(type, data)
      super("Unexpected result type - #{type.inspect}. Data: #{data.inspect}")
    end
  end
end
