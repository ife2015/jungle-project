class ProductsController < ApplicationController

  def index
    puts ENV['USERNAME'] 
    puts ENV['PASSWORD']
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
