class PurchaseController < ApplicationController
    def index

    end

    def show
        @image = Image.all
        @good = Good.find(1)
    end

end