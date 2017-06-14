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

  context 'when cart contains 2 distinct books' do
    it 'applies 5% discount on distinct book lot' do
      expect(subject.checkout([1, 2])).to eq 15.2
    end

    xit ' does not apply discount on duplicate copies' do
      expect(subject.checkout([1, 2, 2])).to eq 23.2
    end
  end

  describe '.cart_lots' do
    it 'decomposes cart into lots of distinct books' do
      cart = [1, 2, 2]
      expect(subject.cart_lots(cart)).to eq [[1, 2], [2]]
    end

    it 'decomposes cart into more lots' do
      cart = [1, 2, 1, 2, 2]
      expect(subject.cart_lots(cart)).to eq [[1, 2], [1, 2], [2]]
    end
  end
end
