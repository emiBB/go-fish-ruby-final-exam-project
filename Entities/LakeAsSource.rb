class LakeAsSource
  attr_reader :source_cards
  def initialize cards
    @source_cards = cards
  end

  #Returns the size of the 'lake'
  def size_of_source
    @source_cards.length
  end

  #Returns random card from the source and removes it from there
  def random_card
    @source_cards.delete(@source_cards.sample)
  end
end