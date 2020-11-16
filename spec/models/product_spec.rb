require 'rails_helper'

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves succefully with all four fields" do 
    
      @category = Category.new(:name =>"Airplane")

      @products = Product.new(
        :name => "R8 61",
        :quantity => 5,
        :price => 30000,
        :category => @category
      )

      @products.save

      expect(@products.id).to be_present
      # validation tests/examples here
    end

    it "should not be valid without a name" do 
      # validation tests/examples here      
      @category = Category.new(:name =>"Airplane")

       @products = Product.new(
        :name => nil,
        :quantity => 5,
        :price => 300000000,
        :category => @category
      )

      @products.valid?

      expect(@products.errors.full_messages).to include("Name can't be blank")
    end

    it "should not be valid without a quantity" do 
      # validation tests/examples here

      @category = Category.new(:name =>"Airplane")

      @products = Product.new(
       :name => "R-18",
       :quantity => nil,
       :price => 3000,
       :category => @category
     )

     @products.valid?

     expect(@products.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not be valid without a price" do 
      # validation tests/examples here

      @category = Category.new(:name =>"Airplane")

      @products = Product.new(
       :name => "R-18",
       :quantity => 5,
       :price => nil,
       :category => @category
     )

     @products.valid?

     expect(@products.errors.full_messages).to include("Price can't be blank")
    end

    it "should not be valid without a category" do 
      # validation tests/examples here

      @category = Category.new(:name =>"Airplane")

      @products = Product.new(
       :name => "R-18",
       :quantity => 5,
       :price => 500,
       :category => nil
     )

     @products.valid?

     expect(@products.errors.full_messages).to include("Category can't be blank")
    end
  end
end
