class GoodsController < ApplicationController

  # トップページの商品一覧表示
  def index
    @image = Image.find(1)
  
  end

  def new
  end


  def search
    # if params[:m_cat_id]
    #   @m_cat = Category.find(params[:m_cat_id]).children
    # else
    #   @s_cat = Category.find(params[:s_cat_id]).children
    # end
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end
end
