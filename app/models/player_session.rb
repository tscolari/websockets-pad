class PlayerSession
  def initialize(player)
    @player = player
  end

  def channel_name
    "game_#{@player.parameterize}"
  end
end
