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
        '0 0 S' => '0 0 E',
        '0 0 E' => '0 0 N',
        '2 4 N' => '2 4 W',
        '2 4 W' => '2 4 S',
        '2 4 S' => '2 4 E',
        '2 4 E' => '2 4 N',
      }.each do |initial, final|
        it 'changes the direction to left while maintaining the same position' do
          subject = described_class.new initial

          expect { subject.execute 'L' }.to change(subject, :status).from(initial).to(final)
        end
      end
    end


    context 'when turn right command arrives' do
      {
        '0 0 N' => '0 0 E',
        '0 0 E' => '0 0 S',
        '0 0 S' => '0 0 W',
        '0 0 W' => '0 0 N',
        '2 4 N' => '2 4 E',
        '2 4 E' => '2 4 S',
        '2 4 S' => '2 4 W',
        '2 4 W' => '2 4 N',
      }.each do |initial, final|
        it 'changes the direction to left while maintaining the same position' do
          subject = described_class.new initial

          expect { subject.execute 'R' }.to change(subject, :status).from(initial).to(final)
        end
      end
    end


    context 'when move command arrives' do
      {
        '0 0 N' => '0 1 N',
        '0 0 E' => '1 0 E',
        '0 0 S' => '0 -1 S',
        '0 0 W' => '-1 0 W',
        '2 4 N' => '2 5 N',
        '2 4 E' => '3 4 E',
        '2 4 S' => '2 3 S',
        '2 4 W' => '1 4 W',
      }.each do |initial, final|

        it "should move forward one cell towards the direction it's already facing" do
          subject = described_class.new initial

          expect { subject.execute 'M' }.to change(subject, :status).from(initial).to(final)
        end
      end
    end

  end
end
