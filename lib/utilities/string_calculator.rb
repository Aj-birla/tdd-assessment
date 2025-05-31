module Utilities
  class StringCalculator
    def self.add(numbers_str)
      return 0 if numbers_str.empty?
      numbers = numbers_str.split(',').map(&:to_i)
      numbers.sum
    end
  end
end