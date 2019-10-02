class CardsController < ApplicationController
  before_action :set_current_user
  require "payjp"

  def new   #ここでユーザーid確認だよ。
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay   #ここでは顧客のデータを照合するよ情報は保存せずに照合してtokenは保存しているんだ。さっきのidと一緒に
    binding.pry
    Payjp.api_key = Rails.application.credentials.payjp[:secret]  #内緒の鍵です
    if params['payjp-token'].blank?  #空はだめ！やり直し
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )   #お客様情報取得。あとでjsで消すけど
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "complete"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete       #マイページの削除用だよ。データベースから消したいときに使うんだ
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "complete"
  end

  def show  #ここは番号の下４桁と有効期限を表示させてるよ。確認ページ兼削除ページかな
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def complete #登録終了
  end

  private
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end

