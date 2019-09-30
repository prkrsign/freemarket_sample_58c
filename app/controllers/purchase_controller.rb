class PurchaseController < ApplicationController
    def index

    end

# 以下テスト用ダミーです。近日けす予定多分大丈夫なはず。9/29 YS
    def show
        @good = Good.find(params[:id])
    end

    # payjpの支払い記述(神山)
    def pay
        @good = Good.find(params[:id])
        Payjp.api_key = 'sk_test_2ef78e8e70f19787263e2df5'
        charge = Payjp::Charge.create(
        :amount => @good.price,
        :card => params['payjp-token'],
        :currency => 'jpy',
    )
    end

end 