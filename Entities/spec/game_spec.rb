require 'spec_helper'
require 'yaml'

describe Game do
  before :each do
    @first_player = Player.new Hand.new, "William"
    @second_player = Player.new  Hand.new, "Stamat"
    @source = LakeAsSource.new 

    @game = Game.new @first_player, @second_player, @source
  end

  
  describe "#new" do
    it "takes three parameters and returns Game object" do
	  @game.should be_instance_of Game
	end	
  end
  
  describe "#load_game" do
    it "takes one parameter and loads the saved file" do
	  objects = [@first_player, @second_player, @source].to_yaml

	  input = YAML.load(objects)
	  
	  @first_player.name.should eql input[0].name
	  @first_player.hand.cards.should eql input[0].hand.cards
	  
	  @second_player.name.should eql input[1].name
	  @second_player.hand.cards.should eql input[1].hand.cards
	  
	  @source.source_cards.should eql input[2].source_cards
	end
  end
  
  describe "#save_game" do
    it "takes one parameter and saves the data into file" do
	  #throw new NotImplementedException
	end
  end
  
  describe "#deal_cards" do
    it "takes no parameters and deal seven cards to each player and the others go in the lake" do
	  @first_player.hand.cards.size.should eql 0
	  @second_player.hand.cards.size.should eql 0
	  @source.size_of_source.should eql 0
	  
	  @game.deal_cards
	  
	  @first_player.hand.cards.size.should eql 7
	  @second_player.hand.cards.size.should eql 7
	  @game.lake_as_source.source_cards.size.should eql 38
	end
  end
end