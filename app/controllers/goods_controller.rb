class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :show_delete, :good_delete_popup, :destroy]
  
  # トップページの商品一覧表示
  def index

    @goods_new_ladies=Good.recent.mujer.active
    @goods_new_men = Good.recent.hombre.active
    @goods_old_ladies = Good.recent.mujer.sorted
    @goods_old_men = Good.recent.hombre.sorted
    @goods_new_adidas = Good.recent.adi.active
    @goods_new_nike = Good.recent.nk.active
    @goods_new_ysl = Good.recent.ysl.active
    @goods_new_lv = Good.recent.lv.active

  end
  
  def new
    @good = Good.new
    @image = @good.images.build
    #セレクトボックスの初期設定
    @category_parent_array = ["---"]

    #データベースから、親カテゴリーのみを抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end

    @delivery_parent_array = ["---"]
    Delivery.where(ancestry: nil).each do |parent|
      @delivery_parent_array << parent.delivery_method
    end
  end

  def show
    # 以下翻訳：インスタンス変数を定義 グッズテーブル(Good)のID（:id）を所得してくる。9/23 YS
    @user = User.find(1)
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

  #商品商品詳細ページ
  def show_delete
  end

  #商品削除のポップアップページ
  def good_delete_popup
  end

  #商品削除
  def destroy
    @good.destroy
    redirect_to root_path
  end


  def create
    @good = Good.new(good_params)
    @good.save

    if @good.save
      params[:images]['goods_picture'].each do |i|
      @image = @good.images.create!(goods_picture: i)
      end
      redirect_to root_path
    else
      render :new
    end
    
  end

  #before_actionのメソッド（該当するメソッドに共通する部分）
  def set_good
    @good = Good.find(params[:id])
  end


  def search
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
    ).merge(user_id: current_user.id)
  end
end
