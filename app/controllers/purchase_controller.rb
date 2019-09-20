class PurchaseController < ApplicationController
    def index

    end

# 以下テスト用ダミーです。
    def show
        @image = Image.all
        @good = Good.find(1)
    end

end