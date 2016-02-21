class Mission

  def initialize(mission_config)
    @config = mission_config.split("\n")

    @plateau = build_plateau
  end



  private

  attr_reader :config, :plateau



  def build_plateau
    Plateau.new config.shift
  end
end