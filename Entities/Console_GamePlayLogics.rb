module GamePlayLogics
  include LayoutMessages
  def initialize_game
    real_player = Player.new Hand.new, @real_player_name, []
	computer_player = Player.new Hand.new, "Erik Kartmenes", []
	cards_source = LakeAsSource.new
    @game = Game.new real_player, computer_player, cards_source
	@game.deal_cards	
	system ("cls")
	show_server_message("THE GAME WAS SUCCESSFULY INITIALIZED")
  end

  def start_players_interaction
    
  end
end