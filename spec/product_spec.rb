require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = Product.new
  end

  it "is not valid without a name" do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:name]).to include("can't be blank")
  end

  it "is not valid without a price" do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:price]).to include("can't be blank")
  end

  it "is not valid without a quantity" do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:quantity]).to include("can't be blank")
  end

  it "is not valid without a category" do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:category]).to include("can't be blank")
  end
end
