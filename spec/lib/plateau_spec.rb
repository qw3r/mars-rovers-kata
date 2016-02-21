require_relative '../../lib/plateau'

RSpec.describe Plateau do
  subject { described_class.new '5 5' }

  describe '#include?' do
    {
      [4, 4] => true,
      [0, 0] => true,
      [5, 5] => true,
      [0, 6] => false,
      [-1, 0] => false,
      [-5, -5] => false,
    }.each do |(x, y), expected|
      it "returns #{expected} for position [#{x}, #{y}]" do
        expect(subject.include?(x, y)).to eq expected
      end
    end
  end

end
