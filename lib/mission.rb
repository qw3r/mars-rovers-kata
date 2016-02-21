require 'plateau'
require 'rover'

class Mission

  def initialize(mission_config)
    @config = mission_config.split("\n")

    @plateau = build_plateau config[0]
    @rovers = build_rovers config[1..-1]
  end



  private

  attr_reader :config, :plateau



  def build_plateau(config)
    Plateau.new config
  end



  def build_rovers(config)
    config.each_slice(2).map do |status, commands|
      {
        rover: Rover.new(status, plateau),
        commands: commands.split(''),
      }
    end
  end

end