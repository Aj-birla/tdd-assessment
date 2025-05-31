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
    end
  end
end