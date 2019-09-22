class PurchaseController < ApplicationController
    def index

    end

# 以下テスト用ダミーです。
    def show
        @image = Image.find(1)
        @good = Good.find(1)
    end

end