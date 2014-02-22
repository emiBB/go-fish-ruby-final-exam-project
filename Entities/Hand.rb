class Hand
  attr_reader :cards
  
  def initialize cards = []
    @cards = cards
  end
  
  #checks for rank in the hand
  def include_rank?(rank_to_check)
    ranks.include?(rank_to_check)
  end
  
  #returns array of cards with the same rank
  def cards_with_same_rank(rank)
    @cards.select { |card| card.rank == rank }
  end
  
  #pushes card into the hand
  def push_card(card_to_be_pushed = nil)
    @cards<<card_to_be_pushed
  end
  
  #returns a Card object and removes it from the hand
  def pop_card(card_to_be_popped)
	if card_to_be_popped.class != NilClass and self.include_rank?(card_to_be_popped.rank) then
      @cards.delete(@cards.select {|card| card == card_to_be_popped}.first)
    else
      #nil
    end	
  end
  
  #returns a random rank from the hand(Used for the computer gameplay)
  def get_random_rank
    return ranks.sample
  end
  
  #returns array of colors missing for this rank
  #This method is used for the computer gameplay
  def missing_colors_for_rank rank
    filtered_by_rank = @cards.select {|card| card.rank == rank}
	colors_for_given_rank = []
	filtered_by_rank.each {|card| colors_for_given_rank<<card.color}
	return [:heart, :diamond, :spade, :club] - colors_for_given_rank
  end
  private
  #returns an array with all the ranks
  def ranks
    cards.map(&:rank)
  end
end