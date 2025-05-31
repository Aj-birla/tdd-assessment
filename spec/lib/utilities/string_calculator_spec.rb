require_relative '../../../lib/utilities/string_calculator'
RSpec.describe Utilities::StringCalculator do
  describe '.add' do
    it 'is defined as a class method' do
      expect(described_class).to respond_to(:add)
    end

    it 'expects exactly one argument' do
      method = described_class.method(:add)
      expect(method.arity).to eq(1)
    end

    context 'when input is an empty string' do
      it 'returns 0' do
        result = described_class.add('')
        expect(result).to eq(0)
      end
    end

    context "when input is non empty string" do
      context "when string contains only signle number" do
        it "returns the same number as integer value" do
          result = described_class.add('4')
          expect(result).to eq(4)
        end
      end

      context "when string contains multiple number by comma separated" do
        it "returns sum of all comma separated numbers" do
          result = described_class.add('1,4,5')
          expect(result).to eq(10)
        end
      end

      context "when string contains newline delimiter with numbers" do
        it "handles newlines b/w nums and returns correct sum of all numbers" do
          result = described_class.add("1\n2,4,5")
          expect(result).to eq(12)
        end
      end

      context "when string contains custom delimiters" do
        it 'returns the correct sum by ignoring custom delimiters' do
          expect(described_class.add("//;\n1;2")).to eq(3)
        end
      end
    end
  end
end