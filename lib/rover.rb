class Rover

  attr_reader :status



  def initialize(status = '0 0 N')
    boot_up *status.split(' ')
  end



  def status
    "#{x} #{y} #{direction}"
  end



  def execute(command)
    case command
      when COMMANDS[:left], COMMANDS[:right]
        turn command
      when COMMANDS[:move]
        move
    end

    @status = "0 0 #{direction}"
  end



  private

  COMMANDS = {left: 'L', right: 'R', move: 'M'}
  DIRECTIONS = {COMMANDS[:left] => -1, COMMANDS[:right] => 1}
  CARDINALS = %w(N E S W)

  attr_reader :x, :y, :wheel



  def boot_up(x, y, initial_direction)
    @x = Integer(x)
    @y = Integer(y)
    @wheel = CARDINALS.rotate(CARDINALS.index(initial_direction))
  end



  def direction
    wheel.first
  end



  def turn(command)
    wheel.rotate! DIRECTIONS[command]
  end



  def move
    case direction
      when 'N'
        @y += 1
      when 'E'
        @x += 1
      when 'S'
        @y -= 1
      when 'W'
        @x -= 1
    end
  end
end