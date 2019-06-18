class ProductsController < ApplicationController

  # トップページ
  def index
    # 後にリファクタリングしていく
    # 現状はladiesとmend、そしてシャネル/ルイヴィトンのみを表示させる
    @ladies = Category.find_by(id: 1)
    @mens = Category.find_by(id: 2)
    @chanel = Brand.find_by(id: 1)
    @vuitton = Brand.find_by(id: 2)

    # includesで実験
    # @ladies_product = Product.where(category_id: @ladies.id).limit(4).order(id: "DESC") これだとmain, subのカテゴリーを検索できない

    # joinでproductテーブルのcategory_idとcategoryテーブルのidを結合させ、mergeメソッドでcategoryのmain_category_idが1のものを特定させている
    @ladies_item = Product.joins(:category).merge(Category.where(main_category_id: 1)).limit(4).order(id: "DESC")

  end

  # 商品出品画面
  def new
    @product = Product.new
  end

  # 商品詳細画面
  def show
    # @product = Product.find(params[:id])
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
