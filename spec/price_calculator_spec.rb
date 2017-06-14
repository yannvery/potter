require_relative '../lib/price_calculator'

describe PriceCalculator do
  subject { PriceCalculator }

  it 'returns 0 when cart is empty' do
    expect(subject.checkout([])).to eq 0
  end

  it 'returns 8 when cart contains 1 book' do
    expect(subject.checkout([1])).to eq 8
  end

  it 'returns 16 when cart contains 2 books' do
    expect(subject.checkout([1,1])).to eq 16
  end

  it 'applies 5% discount when cart contains 2 distinct books' do
    expect(subject.checkout([1,2])).to eq 15.2
  end
end
