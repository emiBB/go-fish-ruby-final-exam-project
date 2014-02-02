require 'spec_helper'

describe Card do
  before :each do
    @card = Card.new :jack, :diamond
	@card_to_compare = Card.new :king, :diamond
  end
  
  describe "#new" do
    it "takes two parameters and returns Card object" do
	  @card.should be_instance_of Card 
	end	
  end
  
  describe "#to_s" do
    it "returns the string representation of Card object" do
	  @card.to_s.should eql 'jack_diamond'
	end	
  end
  
  describe "#==" do
    it "defines equality between two cards" do
	  @card.==(@card).should eql true
	  @card.==(@card_to_compare).should_not eql true
	end	
  end
end