class PurchaseController < ApplicationController

    require 'payjp'
    before_action :set_good

    before_action :authenticate_user!, only: [:show]


    def index
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to controller: "cards", action: "new"
      else
        Payjp.api_key = Rails.application.credentials.payjp[:secret]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end

    def pay
      card = Card.where(user_id: current_user.id).first
        Payjp.api_key = Rails.application.credentials.payjp[:secret]
        Payjp::Charge.create(
        :amount => @good.price, 
        :customer => card.customer_id,
        :currency => 'jpy', 
      )
      redirect_to action: 'done' #完了画面に移動
    end

    def done
    end


    def delete
      @good = Good.find_by(id: params[:id])
      @good.destroy
      redirect_to("/")
    end

    

# 以下テスト用ダミーです。近日けす予定多分大丈夫なはず。9/29 YS
    def show
        @good = Good.find(params[:id])

    end

    def select
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to controller: "cards", action: "new"
      else
        Payjp.api_key = Rails.application.credentials.payjp[:secret]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end

private
  def set_good
    @good = Good.find(params[:id])
  end
end 