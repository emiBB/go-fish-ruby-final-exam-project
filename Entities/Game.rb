require_relative 'Player.rb'
require_relative 'Card.rb'
require_relative 'LakeAsSource.rb'
require_relative 'CardsDeck.rb'
require 'yaml'

class Game
  attr_reader :first_player, :second_player, :lake_as_source, :saved_games
  
  def initialize fplayer, splayer, source
	@first_player = fplayer
	@second_player = splayer
	@lake_as_source = source
	@saved_games = {}
	load_saved_games
  end
  
  #Saves game
  def save_game
    formatted_date = Time.now.to_s[0..18].gsub(' ', '@').gsub(':','-')
    file_name = "saved-game-on-#{formatted_date}.yml"
    output = File.new("C:/Users/Ninka/Desktop/New folder/#{file_name}", 'w')
	output.puts YAML.dump(self)
	output.close
	load_saved_games
  end
  
  #Loads game depending on the 'saved_game_name' !!!
  def load_game saved_game_name
	input = File.new("C:/Users/Ninka/Desktop/New folder/#{saved_game_name}.yml", 'r')
	loaded = YAML.load(input.read)
    @first_player, @second_player = loaded.first_player, loaded.second_player
	@lake_as_source = loaded.lake_as_source
	input.close
  end
  
  #Deals cards to the players and the others are being assigned to the 'lake'
  def deal_cards
    full_deck = CardsDeck.new.full_deck
	cards_for_player @first_player, full_deck
	cards_for_player @second_player, full_deck
	@lake_as_source = LakeAsSource.new(full_deck)
  end
  
  private
  #Deals seven cards to the passed player from the passed deck
  def cards_for_player player, deck
	1.upto(7){ |i| 
	  random_card = deck.sample
	  player.push_card_to_hand(random_card)
	  deck.delete_if{ |card| card.rank == random_card.rank and card.color == random_card.color }
	  }
  end
  
  #Loads all the saved games into the game object on initialization and after game is saved
  def load_saved_games
    Dir.glob("C:/Users/Ninka/Desktop/New folder/*.yml").each_with_object(@saved_games) do |filename, hsh|
	  hsh[File.basename(filename,'.yml')] = filename
	end
  end
end