module Cucumber
  module Impersonators
    def red_fin
      @red_fin ||= RedFin.new self
    end
  end
end
