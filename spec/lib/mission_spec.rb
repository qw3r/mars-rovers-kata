require 'mission'

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
    let(:plateau) { double('Plateau').as_null_object }


    before do
      allow(Plateau).to receive(:new).and_return(plateau)
    end


    it 'builds the plateau with the proper config' do
      expect(Plateau).to receive(:new).with('5 5')

      described_class.new input
    end


    it 'builds the rovers with the proper config' do
      expect(Rover).to receive(:new).with('1 2 N', plateau).ordered
      expect(Rover).to receive(:new).with('3 3 E', plateau).ordered

      described_class.new input
    end


  end

end
