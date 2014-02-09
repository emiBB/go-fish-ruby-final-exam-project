require 'spec_helper'

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
	  
	end
  end
  
  describe "#save_game" do
    it "takes one parameter and saves the data into file" do
	  
	end
  end
  
  
end