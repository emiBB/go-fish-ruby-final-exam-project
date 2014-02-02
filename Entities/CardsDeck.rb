require_relative "Card.rb"
class CardsDeck
  attr_reader :full_deck
  
  RANKS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  COLORS = [:diamond, :heart, :spade, :club]
  
  def initialize
    @full_deck = []
    RANKS.each do |rank|
	  COLORS.each do |color|
	    @full_deck<<(Card.new(rank,color))
	  end
	end
  end
end