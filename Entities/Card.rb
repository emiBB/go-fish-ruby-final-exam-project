class Card
  attr_reader :rank, :color
  
  def initialize rank, color
    @rank = rank
	@color = color
  end
  
  def ==(another_card)
    rank == another_card.rank
  end
  
  def to_s
    "#{rank}_#{color}"
  end
end