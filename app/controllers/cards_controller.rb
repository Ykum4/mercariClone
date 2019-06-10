class CardsController < ApplicationController
  before_action :get_payjp_customer
  before_action :get_card_info

  # カード登録していなければ追加するページへの遷移リンク
  def addcard
    if @card
      render :show
    else
      render :new
    end
  end

  # クレジットカード登録ページ
  def new 
  end

  def show
    
  end

  def create
    # カードの作成
    card = @payjp_customer.cards.create(
      card: params[:payjp_token]
    )
    redirect_to root_path
  end

  private
  def get_payjp_customer
    @payjp_customer =  Payjp::Customer.retrieve(current_user.payjp_customer_id)
  end
  def get_card_info
    if @payjp_customer.default_card
      return @card = @payjp_customer.cards.retrieve(@payjp_customer.default_card)
    end
  end
end
