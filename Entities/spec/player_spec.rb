require 'spec_helper'

describe Player do
  before :each do
    @c1 = Card.new :jack, :diamond
	@c2 = Card.new :queen, :heart
	@card_to_be_pushed = Card.new :king, :spade
	@hand = Hand.new([@c1, @c2])
	@player = Player.new @hand, "Spec Player"
	
	@c11 = Card.new :jack, :spade
	@c21 = Card.new :king, :diamond
	@h2 = Hand.new ([@c11, @c21])
	@other_player = Player.new @h2, 'Spec Player opponent'
	
	@lake = LakeAsSource.new([Card.new(:ace, :heart), Card.new(:king, :club), Card.new(:nine, :spade)])
  end
  
  describe "#new" do
    it "takes two parameters and returns Player object" do
	  @player.should be_instance_of Player
	end	
  end
  
  describe "#push_card_to_hand" do
    it "takes one parameter(Card object) and pushes card to the hand" do
	  @player.hand.include_rank?(:king).should_not eql true
  	  @player.hand.cards.size.should eql 2
  	  @player.push_card_to_hand(@card_to_be_pushed)
  	  @player.hand.cards.size.should eql 3
	  @player.hand.include_rank?(:king).should eql true
  	end	
  end
  
  describe "#ask_for_card" do
    it "takes two arguments: another player and card to be asked for" do
	  @player.hand.cards.size.should eql 2
	  @player.hand.include_rank?(:king).should_not eql true
	  @other_player.hand.cards.size.should eql 2
	  @other_player.hand.include_rank?(:king).should eql true
	  
	  @player.ask_for_card(@other_player, @c21)
	  
	  @player.hand.cards.size.should eql 3
	  @player.hand.include_rank?(:king).should eql true
	  @other_player.hand.cards.size.should eql 1
	  @other_player.hand.include_rank?(:king).should_not eql true
  	end	
  end

  describe "#pick_card_from_lake" do
    it "picks random card from lake with cards" do
	  @player.hand.cards.size.should eql 2
	  @lake.source_cards.size.should eql 3
	  
	  @player.pick_card_from_lake(@lake)
	  
	  @player.hand.cards.size.should eql 3
	  @lake.source_cards.size.should eql 2
	end
  end
end