# transactions/cardsControllerで呼ばれるようにカード関連の処理はmodule化
module CardMethod
  extend ActiveSupport::Concern
  def create
    
  end

  # カードの削除
  def destroy
    @card.delete
    render :new
  end

  private
  # ユーザー登録時にcustomer_idをUserテーブルに紐付けさせている
  def get_payjp_customer
    @payjp_customer =  Payjp::Customer.retrieve(current_user.payjp_customer_id)
  end
  # カードを登録していればカード情報取得
  def get_card_info
    if @payjp_customer.default_card
      return @card = @payjp_customer.cards.retrieve(@payjp_customer.default_card)
    end
  end
end