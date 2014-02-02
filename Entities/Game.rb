require_realtive 'Player.rb'
require_realtive 'Card.rb'
require_realtive 'LakeAsSource.rb'
require_realtive 'CardsDeck.rb'

class Game
  
  def initialize fplayer, splayer, source
	@first_player = fplayer
	@second_player = splayer
	@lake_as_source = source
  end
  
  #«арежда запазена игра
  def load_game file_name

  end
  
  #–аздава карти на играчите и останалите ги слага в 'езерото'
  def deal_cards
    
  end
end