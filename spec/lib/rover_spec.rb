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
      {
        '0 0 N' => '0 0 W',
        '0 0 W' => '0 0 S',
        # '2 2 N' => '2 2 W',
        # '2 2 W' => '2 2 S',
        # '2 2 S' => '2 2 E',
        # '2 2 E' => '2 2 N',
      }.each do |initial, final|
        it 'changes the direction to left while maintaining the same position' do
          subject = described_class.new initial

          expect { subject.execute 'L' }.to change(subject, :status).from(initial).to(final)
        end
      end
    end


    context 'when turn right command arrives' do

      it 'changes its direction (from North to West)' do
        expect { subject.execute 'R' }.to change(subject, :status).from('0 0 N').to('0 0 E')
      end

    end
  end
end
