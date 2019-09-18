class ProductsController < ApplicationController
  def index
  end

  def show
    @good = Good.find(1)
    @image = Image.find(1)
  end


  def new

  end

  def create
    product = Product.new(product_params)
    product.save!

    # @goods = Goods.create(goods_name: "i",goods_description: "i")
    # Goods.create(goods_name: params[:goods_name], price: params[:price], goods_description: params[:goods_description])

  end

  private

  def product_params
    params.permit(:goods_name, :goods_discription, :price)
  end


end
