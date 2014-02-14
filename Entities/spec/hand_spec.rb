require 'spec_helper'

describe Hand do
  before :each do
    @c1 = Card.new :jack, :diamond
	@c2 = Card.new :queen, :heart
	@c3 = Card.new :king, :spade
	@c4 = Card.new :jack, :spade
	@hand = Hand.new
  end
  
  describe "#new" do
    it "takes no parameters and returns Hand object" do
	  @hand.should be_instance_of Hand
	end	
  end
  
  describe "#push_card" do 
  it "adds new card to the Hand object" do
	  @hand.push_card(Card.new :jack, :diamond)
	  added_card = @hand.cards[0]
	  added_card.rank.should eql :jack and added_card.color.should eql :diamond
	end
  end
  
  describe "#include_rank?" do 
  it "checks for rank in the hand" do
	  @hand.push_card(Card.new :jack, :diamond)
	  @hand.include_rank?(:jack).should eql true
	  @hand.include_rank?(:queen).should eql false
	end
  end
  
  describe "#cards_with_same_rank" do 
  it "returns array of cards with the same rank" do
	  @hand.push_card(Card.new :jack, :diamond)
	  cards_same_rank = @hand.cards_with_same_rank(:jack)[0]
	  cards_same_rank.should == (Card.new :jack, :diamond)
	end
  end
  
  describe "#pop_card" do 
  it "returns a Card object and removes it from the hand" do
	  @hand.push_card(@c1)
	  @hand.push_card(@c2)
	  @hand.push_card(@c4)
	  @hand.cards.size.should eql 3
	  @hand.pop_card(@c1).should == (@c1)
	  @hand.cards.size.should eql 2
	  non_existing = Card.new :king, :spade
      @hand.pop_card(non_existing).should == nil	  
	end
  end
end