require 'plateau'
require 'rover'

class Mission

  def initialize(mission_config)
    @config = mission_config.split("\n")

    @plateau = build_plateau config[0]
    @rovers = build_rovers config[1..-1]
  end



  def run
    execute_commands
    show_statuses
  end



  private

  attr_reader :config, :plateau, :rovers



  def build_plateau(config)
    Plateau.new config
  end



  def build_rovers(config)
    config.each_slice(2).map { |status, commands| [Rover.new(status, plateau), commands.split('')] }
  end



  def execute_commands
    rovers.each do |rover, commands|
      commands.each { |command| rover.execute command }
    end
  end



  def show_statuses
    rovers.each { |rover, _| puts rover.status }
  end

end