require_relative '../../../lib/utilities/string_calculator'
RSpec.describe Utilities::StringCalculator do
  describe '.add' do
    it 'is defined as a class method' do
      expect(described_class).to respond_to(:add)
    end

    it 'expects exactly one argument' do
      expect(described_class.method(:add).arity).to eq(1)
    end

    context 'when input is an empty string' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'when input is a non-empty string' do
      context 'and contains a single number' do
        it 'returns the number as an integer' do
          expect(described_class.add('4')).to eq(4)
        end
      end

      context 'and contains multiple comma-separated numbers' do
        it 'returns the sum of all numbers' do
          expect(described_class.add('1,4,5')).to eq(10)
        end
      end

      context 'and contains newline delimiters' do
        it 'handles newlines and returns the correct sum' do
          expect(described_class.add("1\n2,4,5")).to eq(12)
        end
      end

      context 'and contains custom delimiters' do
        it 'returns the correct sum using the custom delimiter' do
          expect(described_class.add("//;\n1;2")).to eq(3)
        end
      end

      context 'and contains negative numbers' do
        it 'raises an error listing all negative numbers' do
          expect { described_class.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
        end
      end
    end
  end
end