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
  end
end