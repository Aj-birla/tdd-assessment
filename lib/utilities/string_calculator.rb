module Utilities
  class StringCalculator
    def self.add(numbers_str)
      return 0 if numbers_str.empty?

      delimiter = ","
      if numbers_str.start_with?("//")
        delimiter_section, numbers_str = numbers_str.split("\n", 2)
        delimiter = delimiter_section[2]
      end

      numbers_str.gsub!("\n", delimiter)
      numbers = numbers_str.split(delimiter).map(&:to_i)
      numbers.sum
    end
  end
end