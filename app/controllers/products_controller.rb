class ProductsController < ApplicationController

  def index
    
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :product_size_id, :brand_id, :condition, :shipping_method, :shipping_burden, :area_id, :estimated_date, :price).merge(user_id: current_user.id, brand_id: 1)
  end
end
