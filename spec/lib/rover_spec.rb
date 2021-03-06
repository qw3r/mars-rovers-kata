require_relative '../../lib/rover'
require_relative '../../lib/plateau'

RSpec.describe Rover do
  context 'when initialized without a plateau' do
    describe '#status' do
      context 'when no config is provided' do
        it 'is placed at position 0,0 heading North' do
          expect(subject.status).to eq '0 0 N'
        end

      end


      context 'when config is provided' do
        subject { described_class.new '3 4 W' }

        it 'is placed at that position' do
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

          it "moves forward one cell towards the direction it's already facing" do
            subject = described_class.new initial

            expect { subject.execute 'M' }.to change(subject, :status).from(initial).to(final)
          end
        end
      end


      context 'when invalid command arrives' do
        it 'does nothing' do
          expect { subject.execute 'm' }.to_not change(subject, :status)
        end
      end
    end
  end


  context 'when initialized with a designated plateau' do
    let(:plateau) { Plateau.new('5 5') }

    describe '#initialize' do
      it 'works all right when placed inside the plateau' do
        expect { described_class.new '0 0 N', plateau }.to_not raise_error
      end


      it 'raises out-of-range error when placed outside the plateau' do
        expect { described_class.new '0 6 N', plateau }.to raise_error Rover::OutOfRangeError
      end
    end


    describe '#execute' do
      context 'when move command arrives' do
        it 'works all right when inside the plateau' do
          subject = described_class.new '5 3 W', plateau

          expect { subject.execute 'M' }.to_not raise_error
        end


        it 'raises out-of-range error when moved outside the plateau' do
          subject = described_class.new '5 3 E', plateau

          expect { subject.execute 'M' }.to raise_error Rover::OutOfRangeError
        end
      end
    end

  end
end
