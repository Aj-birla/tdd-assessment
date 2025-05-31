module Utilities
  class StringCalculator
    class << self
      def add(numbers_str)
        return 0 if numbers_str.empty?

        numbers = process(numbers_str)

        numbers.sum
      end

      private
      def process(numbers_str)
        delimiter = ","
        if numbers_str.start_with?("//")
          delimiter_section, numbers_str = numbers_str.split("\n", 2)
          delimiter = delimiter_section[2]
        end

        numbers_str.gsub!("\n", delimiter)
        numbers = numbers_str.split(delimiter).map(&:to_i)

        validate_negative_values(numbers)
        numbers
      end

      def validate_negative_values(numbers)
        negatives = numbers.select { |n| n < 0 }
        if negatives.any?
          raise "negative numbers not allowed #{negatives.join(',')}"
        end
      end
    end
  end
end