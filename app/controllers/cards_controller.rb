class CardsController < ApplicationController
  before_action :get_payjp_customer

  def new 
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
end
