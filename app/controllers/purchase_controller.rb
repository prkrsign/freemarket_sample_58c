class PurchaseController < ApplicationController
    def index

    end

# 以下テスト用ダミーです。
    def show
        # @image = Image.all
        # @image = Image.find(17)
        # @good = Good.find(1)
        @good = Good.find(params[:id])
    end

end 