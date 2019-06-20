class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_product
  before_action :get_payjp_customer
  before_action :get_card_info
  # カード登録の処理はmodule化して呼び出せるように
  include CardMethod

  # 購入画面
  def new
    
  end

  # 購入ボタン後の処理
  def create
    price = @product.price
    charge = Payjp::Charge.create(
      :amount => price,
      :customer => @payjp_customer, # CardMethodで定義済み
      :currency => 'jpy',
    )
    @product.update(status: 3) # 商品の状態を売り切れにする
    redirect_to complete_product_transactions_path(@product)

  end

  private 
  def product_params
    params.permit(:product_id)
  end
  def get_product
    @product = Product.find(product_params[:product_id])
  end
end
