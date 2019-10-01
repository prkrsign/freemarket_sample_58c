class PurchaseController < ApplicationController
    require 'payjp'
    before_action :set_good
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

    def 
    def show
    end

    def select
      # binding.pry
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
    # binding.pry
    @good = Good.find(params[:id])
  end


    # payjpの支払い記述(神山)
    # def pay
    #     @good = Good.find(params[:id])
    #     Payjp.api_key = 'sk_test_2ef78e8e70f19787263e2df5'
    #     charge = Payjp::Charge.create(
    #     :amount => @good.price,
    #     :card => params['payjp-token'],
    #     :currency => 'jpy',
    # )
    # end

end 