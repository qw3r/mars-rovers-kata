require 'rover'

RSpec.describe Rover do
  describe '#status' do
    it 'should be initialized on position 0,0 heading North' do
      expect(subject.status).to eq '0 0 N'
    end
  end
end
