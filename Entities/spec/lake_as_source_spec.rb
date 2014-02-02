require 'spec_helper'

describe LakeAsSource do
  before :each do
    @c1 = Card.new :jack, :diamond
	@c2 = Card.new :queen, :heart
	@c3 = Card.new :king, :spade
	@lake = LakeAsSource.new
	@lake.source_cards << @c1
	@lake.source_cards << @c2
	@lake.source_cards << @c3
  end
  
  describe "#new" do
    it "takes no parameters and returns LakeAsSource object" do
	  @lake.should be_instance_of LakeAsSource
	end	
  end
  
  describe "#size_of_source" do
    it "takes no parameters and returns size of the lake" do
	  @lake.size_of_source.should eql 3
	end	
  end
  
  describe "#random_card" do
    it "takes no parameters and returns random card from lake" do
	  initial_ranks = @lake.source_cards.map(&:rank)
	  
	  initial_size = @lake.size_of_source
	  initial_size.should eql 3
	  
	  random_card = @lake.random_card
	  
	  post_ranks = @lake.source_cards.map(&:rank)
	  
	  post_size = @lake.size_of_source
	  post_size.should eql 2
	  
	  ([random_card.rank] + post_ranks).sort.should eql initial_ranks.sort	  
	end	
  end
end