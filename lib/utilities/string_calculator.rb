module Utilities
  class StringCalculator
    def self.add(numbers_str)
      return 0 if numbers_str.empty?
      numbers_str.to_i if numbers_str =~ /^\d+$/
    end
  end
end