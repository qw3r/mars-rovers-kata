class Rover

  attr_reader :status



  def initialize(status = '0 0 N')
    @status = status
  end

end