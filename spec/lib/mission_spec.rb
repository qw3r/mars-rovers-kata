require_relative '../../lib/mission'

RSpec.describe Mission, :integration do
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

  describe '#run', :integration do
    it 'outputs the final position of each rover' do
      expected_output = <<~OUTPUT
        1 3 N
        5 1 E
      OUTPUT

      expect { subject.run }.to output(expected_output).to_stdout
    end
  end

end
