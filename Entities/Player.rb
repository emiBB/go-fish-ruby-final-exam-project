require_relative "Hand.rb"
require_relative "Card.rb"
require_relative "LakeAsSource.rb"

class Player
  attr_reader :hand, :name, :cleared_cards
  
  def initialize hand = Hand.new, name = 'unknown', cleared = []
    @hand = hand
	@name = name
	@cleared_cards = cleared
  end
  
  #the player adds card to his hand
  def push_card_to_hand(card_to_be_pushed = nil)
    @hand.push_card(card_to_be_pushed)
	clear_four_of_a_kind
  end
  
  #the player removes card from his hand
  def pop_card_from_hand(card_to_be_popped)
    @hand.pop_card(card_to_be_popped)
  end
  
  #Here we ask the other player for card and if he has one
  #we take it from him and push it in our hand. Otherwise we push nil.
  def ask_for_card(other_player, card)
    if other_player.hand.include_rank?(card.rank)
	  push_card_to_hand(other_player.pop_card_from_hand(card))
	else
	  push_card_to_hand
	end
  end
  
  #This method gets called if we have asked for a card and the opponent
  #didn't have the one. Then we have to pick from the 'lake' of cards.
  #source is from type: LakeAsSource
  def pick_card_from_lake(source)
    push_card_to_hand(source.random_card)
  end
  
  #Returns the number of cards in the hand of the player
  def hand_size
    @hand.cards.size
  end
  
  #the method is used to clear four cards of the same kind from the hand
  def clear_four_of_a_kind
    grouped_by_rank = @hand.cards.group_by {|card| card.rank}
    four_of_rank_hash = grouped_by_rank.select {|key, value| value.size == 4}
    four_of_rank_keys = []
	four_of_rank_hash.map{|key,value| four_of_rank_keys << key}
  
    four_of_rank_keys.each { |rank|
	  @hand.cards.each { |card| @cleared_cards<< card if card.rank == rank }
      @hand.cards.delete_if{|card| card.rank == rank}
	}
    
  end
end