class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  # トップページ
  def index
    @ladies = Category.find_by(id: 1)
    @ladies_items = Product.of_category(1)
    @mens = Category.find_by(id: 2)
    @mens_items = Product.of_category(2)
    @chanel = Brand.find_by(id: 1)
    @chanel_items = Product.of_brand(1)
    @vuitton = Brand.find_by(id: 2)
    @vuitton_items = Product.of_brand(2)
  end

  # 商品出品画面
  def new
    @product = Product.new
  end

  # 商品詳細画面
  def show
    @product = Product.find(params[:id])
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
