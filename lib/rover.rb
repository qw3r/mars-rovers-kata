class Rover

  attr_reader :status



  def initialize(status = '0 0 N')
    @x, @y, cardinal = status.split(' ')
    @wheel = CARDINALS.rotate(CARDINALS.index(cardinal))
  end



  def status
    "#{x} #{y} #{direction}"
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
  CARDINALS = %w(N E S W)

  attr_reader :x, :y, :wheel



  def direction
    wheel.first
  end



  def turn(command)
    wheel.rotate! DIRECTIONS[command]
  end

end