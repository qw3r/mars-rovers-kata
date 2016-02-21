require 'rover'

RSpec.describe Rover do
  describe '#status' do
    context 'when no config is provided' do

      it 'is spawned on position 0,0 heading North' do
        expect(subject.status).to eq '0 0 N'
      end

    end


    context 'when config is provided' do
      subject { described_class.new '3 4 W' }

      it 'is spawned on that position' do
        expect(subject.status).to eq '3 4 W'
      end

    end
  end


  describe '#execute' do
    context 'when turn left command arrives' do

      it 'changes its direction (from North to West)' do
        expect { subject.execute 'L' }.to change(subject, :status).from('0 0 N').to('0 0 W')
      end

    end
  end
end
