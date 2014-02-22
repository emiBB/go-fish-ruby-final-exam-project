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
  
  describe "#pop_card_from_hand" do
    it "Takes one parameter Card object and removes it from the hand" do
	  @player.hand_size.should eql 2	  
	  @player.pop_card_from_hand (@c2)
	  @player.hand_size.should eql 1
	  @player.pop_card_from_hand (@c1)
	  @player.hand_size.should eql 0
	end
  end
  
  describe "#ask_for_card" do
    it "takes two arguments: another player and card to be asked for" do
	  @player.hand.cards.size.should eql 2
	  @player.hand.include_rank?(:king).should_not eql true
	  @other_player.hand.cards.size.should eql 2
	  @other_player.hand.include_rank?(:king).should eql true

	  @player.ask_for_card(@other_player, @c21).should eql true

	  @player.hand.cards.size.should eql 3
	  @player.hand.include_rank?(:king).should eql true
	  @other_player.hand.cards.size.should eql 1
	  @other_player.hand.include_rank?(:king).should_not eql true
	  
	  c1 = Card.new :jack, :diamond
	  c2 = Card.new :queen, :spade
	  h1 = Hand.new([c1])
	  h2 = Hand.new([c2])
	  p1 = Player.new h1, "Stefcho"
	  p2 = Player.new h2, "Abdulcho"
	  
	  p1.ask_for_card(p2, c1).should eql false
	  p1.ask_for_card(p2, c2).should eql true
	   
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
  
  describe "#clear_four_of_a_kind" do
    it "checks if four cards of a kind are available and clears them" do
	  card1 = Card.new :queen, :heart
	  card2 = Card.new :queen, :diamond
	  card3 = Card.new :queen, :spade
	  card4 = Card.new :queen, :club
	  card5 = Card.new :ace, :heart
	  card6 = Card.new :two, :club
	  hand = Hand.new ([card1, card2, card3, card4,card5, card6])
	  player = Player.new hand, "Abdul"

	  player.hand_size.should eql 6
	  player.cleared_cards.should eql []

	  player.clear_four_of_a_kind

	  player.hand_size.should eql 2
	  player.cleared_cards.should eql [card1, card2, card3, card4]

	  card7 = Card.new :three, :heart
	  card8 = Card.new :three, :diamond
	  card9 = Card.new :three, :spade
	  card10 = Card.new :three, :club
	  other_hand = Hand.new([card1, card2, card3, card4,card5, card6, card7, card8, card9, card10])

	  other_player = Player.new other_hand, "Anatoly"

	  other_player.hand_size.should eql 10
	  other_player.cleared_cards.should eql []

	  other_player.clear_four_of_a_kind
	  other_player.hand_size.should eql 2
	  other_player.cleared_cards.should eql [card1, card2, card3, card4, card7, card8, card9, card10]
	end
  end
end