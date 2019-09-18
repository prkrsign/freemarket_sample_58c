class PurchaseController < ApplicationController
    def index

    end

    def show
        @image = Image.find(1)
        @good = Good.find(1)
    end

end