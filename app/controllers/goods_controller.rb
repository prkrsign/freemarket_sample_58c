class GoodsController < ApplicationController

  # トップページの商品一覧表示
  def index
    @image = Image.find(17)
  
  end
  
  def new
    @good = Good.new
    @good.images.build
    #セレクトボックスの初期設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみを抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end
  end

  def show

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

  def create
    @good = Good.new(good_params)
    @good.save
    redirect_to root_path

    #if @good.save
      #image_params[:images].each do |image|
       # @good.images.create(goods_picture: image)
      #end
      #redirect_to root_path
    #else
      #render :new
    #end
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
      :price,
      :category_id,
      :brand_id,
      :prefecture_id,
      images_attributes: [:goods_picture]
    ).merge(user_id: 1)
  end

end
