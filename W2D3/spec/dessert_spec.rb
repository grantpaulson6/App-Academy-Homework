require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "bob", :bake => "pizza") }
  subject(:dessert) { Dessert.new("pizza",10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("pizza")
    end

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("pizza","10", :chef)}.to raise_error{ArgumentError}
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("cheese")
      expect(dessert.ingredients).to eq(["cheese"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("dough")
      dessert.add_ingredient("cheese")
      expect(dessert.mix!).to receive(:shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(dessert.eat(20)).to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(dessert.serve).to include("bob")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef.bake).to receive(:dessert)#receive(bake).with(dessert)
    end
  end
end
