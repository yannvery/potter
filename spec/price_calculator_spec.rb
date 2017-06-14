require_relative '../lib/price_calculator'

describe PriceCalculator do
  it 'returns 0 when cart is empty' do
    expect(PriceCalculator.checkout([])).to eq 0
  end
end
