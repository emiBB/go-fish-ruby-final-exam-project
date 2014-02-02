require_relative "Hand.rb"
require_relative "Card.rb"
class Player
  attr_reader :hand, :name
  
  def initialize hand = Hand.new, name = 'unknown'
    @hand = hand
	@name = name
  end
  
  #the player adds card to his hand
  def push_card_to_hand(card_to_be_pushed = nil)
    @hand.push_card(card_to_be_pushed)
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
end