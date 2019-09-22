class PurchaseController < ApplicationController
    def index

    end

# 以下テスト用ダミーです。
    def show
        @image = Image.find(17)
        @good = Good.find(10)
    end

end