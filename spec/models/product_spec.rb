require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before(:each) do
      @category = Category.create(name: "Apparel")
    end

    it "should save with valid attributes" do
      product = Product.new(
        name: "Nice shirt",
        price: 24.95,
        quantity: 55,
        category_id: @category.id
      )
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new(
        name: nil,
        price: 24.95,
        quantity: 55,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product = Product.new(
        name: "Nice shirt",
        price: nil,
        quantity: 55,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product = Product.new(
        name: "Nice shirt",
        price: 24.95,
        quantity: nil,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product = Product.new(
        name: "Nice shirt",
        price: 24.95,
        quantity: 55,
        category_id: nil
      )
      expect(product).to_not be_valid
    end
  end
end
