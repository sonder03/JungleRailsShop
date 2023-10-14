require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before (:each) do
      @category = Category.new(name: "category")
    end

    it 'all fields set' do
      # @category = Category.new(name: 'category')
      @product = Product.new(name: 'product1', category: @category, quantity: 3, price_cents: 100)
      @product.save
      expect(@product).to be_valid
    end

    it 'got a name' do
      # @category = Category.new(name: 'category')
      @product = Product.new(name: nil, category: @category, quantity: 1, price_cents: 200)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'have a price' do
      # @category = Category.new(name: 'category')
      @product = Product.new(name: 'product3', category: @category, quantity: 2, price_cents: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'have quantity' do
      # @category = Category.new(name: 'category')
      @product = Product.new(name: 'product4', category: @category, quantity: nil, price_cents: 200)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'has a category' do
      @product = Product.new(name: 'product5', category: nil, quantity: 2, price_cents: 200)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end


  end
end