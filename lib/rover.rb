class Rover

  attr_reader :status



  def initialize(status = '0 0 N')
    @status = status
  end



  def execute(command)
    @status = '0 0 W'
  end
end