class Plateau

  def initialize(config)
    width, height = config.split ' '

    @min = {x: 0, y: 0}
    @max = {x: Integer(width), y: Integer(height)}
  end



  def include?(x, y)
    not (x < min[:x] || y < min[:y] || x > max[:x] || y > max[:y])
  end



  private

  attr_reader :min, :max
end