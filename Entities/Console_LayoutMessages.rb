module LayoutMessages
  def show_welcome_header
    puts "\n\n\nW E L C O M E     T O    T H E    G A M E    O F    G O - F I S H  !!!!\n\n"
	show_server_message "What is your name?"
	@real_player_name = gets
	show_server_message "Sooo, welcome-welcome #{@real_player_name}".chomp
    show_server_message "Do you want to start the game?(Y/N)"
	@initial_choice = gets.chomp
    if(@initial_choice == 'Y') 
	  show_server_message "Okay, lets go!!!" 
	elsif(@initial_choice != 'Y')
	  show_server_message "But, why...."
	end
	sleep 3
	system ("cls")
  end

  def show_current_state_of_the_table
	puts "YOU ARE NOW IN THE GAME!!!"
    puts "========================================================"
    puts "\n\n\n\t<<#{@game.second_player.name}>>\n"
	show_opponent_data
	puts "\t<<Source>> [#{@game.lake_as_source.size_of_source}]\n\n\n\n"
	puts "\t<<#{@game.first_player.name.chomp}>>"
	show_real_player_data
	@game.first_player.hand.cards.each {|card| puts "\t[#{card.to_s.chomp}]"}
	puts "\n\n\n"
	puts "========================================================"
  end
  
  def show_opponent_data   
    puts "\t|| Cards in the hand:[#{@game.second_player.hand_size}]\t\tCleared cards: [#{@game.second_player.cleared_cards.size}] ||"
	puts "\n\n\n"
  end
  
  def show_real_player_data
    puts "\t|| Cards in the hand:[#{@game.first_player.hand_size}]\t\tCleared cards: [#{@game.first_player.cleared_cards.size}] ||"
  end
  
  def show_server_message message
    puts "\t\t<<#{message}>>"
  end
end