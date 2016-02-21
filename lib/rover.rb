class Rover

  class OutOfRangeError < StandardError
  end

  attr_reader :status



  def initialize(status = '0 0 N', plateau = nil)
    boot_up *status.split(' ')
    @plateau = plateau
    check_position!
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

  attr_reader :x, :y, :wheel, :plateau



  def boot_up(x, y, initial_direction)
    @x = Integer(x)
    @y = Integer(y)
    @wheel = CARDINALS.rotate(CARDINALS.index(initial_direction))
  end



  def check_position!
    return unless plateau

    raise OutOfRangeError unless plateau.include?(x, y)
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