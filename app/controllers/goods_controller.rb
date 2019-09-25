class GoodsController < ApplicationController
  
  def new
    @good = Good.new
    @image = @good.images.build
    #セレクトボックスの初期設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみを抽出し、配列化
    #Category.where(ancestry: nil).pluck(:id, :category_name ).each do |parent|
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end

    @delivery_parent_array = ["---"]
    Delivery.where(ancestry: nil).each do |parent|
      @delivery_parent_array << parent.delivery_method
    end
  end

  # 以下全て、formatはjsonのみ
  #親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  #配送方法
  def get_delivery_children
    @delivery_children = Delivery.find_by(delivery_method: "#{params[:parent_name]}", ancestry: nil).children
  end


  def create
    @good = Good.new(good_params)
    @good.save

    if @good.save
      #binding.pry
      params[:images]['goods_picture'].each do |i|
       @image = @good.images.create!(goods_picture: i)
      end
      redirect_to root_path
    else
      render :new
    end
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

  private
  def good_params
    params.require(:good).permit(
      :goods_name,
      :goods_description,
      :category_id,
      :size,
      :brand_id,
      :condition_id,
      :delivery_id,
      :prefecture_id,
      :shipment_id,
      :price,
      {images_attributes: [:goods_picture]}
    ).merge(user_id: 1)
  end

end
