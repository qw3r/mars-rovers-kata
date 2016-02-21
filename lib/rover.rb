class Rover

  attr_reader :status



  def initialize(status = '0 0 N')
    @status = status
    @wheel = %w(N E S W)
  end



  def execute(command)
    case command
      when LEFT, RIGHT
        turn command
    end

    @status = "0 0 #{direction}"
  end



  private

  LEFT = 'L'
  RIGHT = 'R'
  DIRECTIONS = {LEFT => -1, RIGHT => 1}
  attr_reader :wheel



  def direction
    wheel.first
  end



  def turn(command)
    wheel.rotate! DIRECTIONS[command]
  end

end