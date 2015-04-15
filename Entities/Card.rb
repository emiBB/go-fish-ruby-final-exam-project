class Card
  attr_reader :rank, :color
  
  def initialize rank, color
    @rank = rank
	@color = color
  end
  
  #Overloading the '==' comparison between two cards
  def ==(another_card)
	if(another_card != nil)
    (@rank == another_card.rank and @color == another_card.color)
	end
  end
  #tozi metod ne e nujen moje da se polzva ala-bala*
  def to_s
    "#{rank}_#{color}"
  end
end
