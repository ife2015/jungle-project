class Admin::DashboardController < ApplicationController
  def show
    @products = Product
    @category = Category
  end
end
