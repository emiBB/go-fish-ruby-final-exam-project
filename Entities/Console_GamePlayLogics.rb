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

  def activate_first_player
    puts "IT IS YOUR TURN!"
	puts "Make your choice:\n1. Ask for card\n2. Save game\n3. Load game\n4. Exit\n\n\n\n"
	user_choice = gets.chomp
	ask_for_card if user_choice == "1"
	save_current_game if user_choice == "2"
	load_game_window if user_choice == "3"
	exit_game_window if user_choice == "4"
  end
  
  def ask_for_card
    system ("cls")
	show_current_state_of_the_table
	puts "Enter rank:"
	selected_rank = gets.chomp
	puts "Enter color:"
	selected_color = gets.chomp
	perform_actual_asking selected_rank, selected_color
  end
  
  def perform_actual_asking rank, color
	card_to_ask_for = Card.new rank.to_sym, color.to_sym
    if(@game.first_player.ask_for_card(@game.second_player, card_to_ask_for))
	  refresh_window
	  puts "<<GREAT! Excellent try! It is your turn again>>"
	  sleep 4
	  @turn = :first_player
	else
	  refresh_window
	  puts "<<#{@game.second_player.name} doesn't have that card. GO FISH now!>>"
	  @game.first_player.pick_card_from_lake(@game.lake_as_source)
	  sleep 4
	  @turn = :second_player
	end
  end
  def save_current_game
    refresh_window
	puts "<<Saving game>>..."
    @game.save_game
	sleep 3
	puts "<<CURRENT GAME WAS SAVED>>"
	sleep 3
	refresh_window
  end
  
  def load_game_window
    refresh_window
	puts "<<Please, select the number of the game to be loaded>>\n\n"
	saves_counter = 0
	game_and_game_number_pairs = {}
	@game.saved_games.each {|key, value| 
	  next_number = saves_counter + 1
	  saves_counter = saves_counter + 1
	  game_and_game_number_pairs[next_number] = key
	}
	game_and_game_number_pairs.each {|key, value| puts "#{key}. #{value}"}
	selected_save = gets.chomp	
	@game.load_game (game_and_game_number_pairs[selected_save.to_i])
	puts "\n<<The game [ #{game_and_game_number_pairs[selected_save.to_i]} ] was succesfuly loaded>>\n"
	sleep 5
	refresh_window
	activate_first_player
  end
  
  def exit_game_window
    refresh_window
    puts "<<Hey, it was a nice run. Bye-bye now>>"
	sleep 3
	exit
  end
  
  def activate_second_player
	rank_to_ask_for = @game.second_player.hand.get_random_rank
	color_sample = @game.second_player.hand.missing_colors_for_rank(rank_to_ask_for).sample
	card_to_ask_for = Card.new rank_to_ask_for, color_sample
	puts "<<The other player is asking for>> #{card_to_ask_for.to_s}"
	sleep 5
	if(@game.second_player.ask_for_card(@game.first_player, card_to_ask_for))
	  refresh_window
	  puts "<<Ouch! The other player guessed right... it is his turn again!>>"
	  sleep 4
	  @turn = :second_player
	else
	  refresh_window
	  puts "<<Whew... you were lucky this time. It is your turn now!>>"
	  sleep 4
	  @game.second_player.pick_card_from_lake(@game.lake_as_source)
	  @turn = :first_player
	end
  end
  
  def refresh_window
    system ("cls")
	show_current_state_of_the_table
  end
end