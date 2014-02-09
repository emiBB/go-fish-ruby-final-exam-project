class LakeAsSource
  attr_reader :source_cards
  def initialize cards = []
    @source_cards = cards
  end

  #Returns the size of the 'lake'
  def size_of_source
    @source_cards.size
  end

  #Returns random card from the source and removes it from there
  def random_card
	random_card = @source_cards.sample
	@source_cards.delete_if{ |card| 
	  card.rank == random_card.rank and card.color == random_card.color 
	}
    random_card
  end
end