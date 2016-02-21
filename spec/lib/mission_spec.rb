require 'mission'
require 'plateau'

RSpec.describe Mission do
  subject { described_class.new input }
  let(:input) {
    <<~END_OF_CONFIG
      5 5
      1 2 N
      LMLMLMLMM
      3 3 E
      MMRMMRMRRM
    END_OF_CONFIG
  }


  describe '#initialize' do
    it 'builds the plateau with the proper config' do
      expect(Plateau).to receive(:new).with('5 5')

      described_class.new input
    end

  end

end
