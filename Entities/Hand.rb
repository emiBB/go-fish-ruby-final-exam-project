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
      @cards.delete(@cards.select {|card| card.rank == card_to_be_popped.rank}.first)
    else
      nil
    end	
  end

  private
  #returns an array with all the ranks
  def ranks
    cards.map(&:rank)
  end
end