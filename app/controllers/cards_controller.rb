class CardsController < ApplicationController
  before_action :get_payjp_customer
  before_action :get_card_info
  before_action :confirm_card_info, except: [:destroy, :create]

  # カードの削除
  include CardMethod

  # カード登録していなければ追加するページへの遷移リンク
  def addcard
  end

  # クレジットカード登録ページ
  def new 
  end

  def show
  end

   # カードの作成
  def create
    card = @payjp_customer.cards.create(
      card: params[:payjp_token]
    )
    redirect_to users_cards_path
  end

  # カードの削除
  def destroy
    @card.delete
    render :new
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

  # カードが登録されているかの確認
  def confirm_card_info
    if @card
      render :show
    else
      render :new 
    end
  end
end
