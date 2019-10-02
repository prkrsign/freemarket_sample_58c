class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :show_delete, :good_delete_popup, :destroy, :edit, :update]
# 以下翻訳 ログインしてないのに出品(new)に行こうとするとログインページに遷移する。9/29 YS
  before_action :authenticate_user!, only: [:new]
  before_action :set_current_user
  
  # トップページの商品一覧表示
  def index
    # binding.pry
    @goods_new_ladies=Good.recent.mujer.active
    @goods_new_men = Good.recent.hombre.active
    @goods_old_ladies=Good.recent.mujer.sorted
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


  def edit
    # ↓この変数をJavascriptファイル内で使う。(edit-image.js)
    gon.good = @good
    gon.images = @good.images

    # @good.imagse.goods_pictureをバイナリデータにしてビューで表示できるようにする。
    require 'base64'
    require 'aws-sdk'
    
    gon.images_binary_datas = []
    if Rails.env.production?
      client = Aws::S3::Client.new(
                             region: 'ap-northeast-1',
                             access_key_id: Rails.application.credentials.aws[:access_key_id],
                             secret_access_key: Rails.application.credentials.aws[:secret_access_key],
                             )
      @good.images.each do |image|
        binary_data = client.get_object(bucket: 'freemarket-sample-58c', key: image.goods_picture.file.path).body.read
        gon.images_binary_datas << Base64.strict_encode64(binary_data)
      end
    else
      @good.images.each do |image|
        binary_data = File.read(image.goods_picture.file.file)
        gon.images_binary_datas << Base64.strict_encode64(binary_data)
      end
    end
  

    @category_parent_array = ['---']
    #データベースから、親カテゴリーのみを抽出し、配列化。
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.category_name
    end
    
    # 子カテゴリーと孫カテゴリーも取り出す。
    @category_child_array = @good.category.parent.parent.children
    @category_grandchild_array = @good.category.parent.children

    # 『配送料の負担』と『配送の方法』もancestryで組んであるので、カテゴリーと同様に取り出す。
    @delivery_parent_array = ['---']
    Delivery.where(ancestry: nil).each do |parent|
      @delivery_parent_array << parent.delivery_method
    end
    @delivery_child_array = @good.delivery.parent.children
  end


  def update
    # 登録済画像のidの配列を生成（編集前の画像のこと）
    ids = @good.images.map{|image| image.id }
    # 登録済画像のうち、編集後もまだ残っている画像のidの配列を生成(文字列から数値に変換)
    exist_ids = registered_image_params[:ids].map(&:to_i)
    # 登録済画像が残っていない場合(配列に０が格納されている)、配列を空にする
    exist_ids.clear if exist_ids[0] == 0
    
    # 画像は必須。画像が1枚でもあればupdate開始。
    if (exist_ids.length != 0 || new_image_params[:images][0] != " ") && @good.update(good_params)
      #登録済画像のうち削除ボタンをおした画像を削除。
      unless ids.length == exist_ids.length
         #削除する画像のidの配列を生成。
         delete_ids = ids - exist_ids
         delete_ids.each do |id|
          @good.images.find(id).destroy
         end
      end

      #新規登録画像があればcreate
      unless new_image_params[:images][0] == " "
        params[:images]['goods_picture'].reverse_each do |i|
          @image = @good.images.create!(goods_picture: i)
        end
        #以下のコードでも追加はできるが、goods_pictureに入る画像名が取得できなかったので上の記述に変更しました。
        #new_image_params[:images].each do |image|
          #@good.images.create(goods_picture: image, good_id: @good.id)
        #end
      end
      redirect_to good_path
    else
      redirect_back
    end
  end


  def show

  end

  
  def search
    if params[:good].nil?
      @goods = Good.where('goods_name LIKE(?) OR goods_description LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").page(params[:page]).per(20)
      @keyword = params[:keyword]
    else
      @goods = Good.where('goods_name LIKE(?) OR goods_description LIKE(?)', "%#{params[:good][:keyword]}%", "%#{params[:good][:keyword]}%").page(params[:page]).per(20)
      @keyword = params[:good][:keyword]
    end
  end


  #親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", ancestry: nil).children
  end

  #子カテゴリーが選択された後に動くアクション
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
      params[:images]['goods_picture'].reverse_each do |i|
      @image = @good.images.create!(goods_picture: i)
      end
      redirect_to root_path, notice: "商品を出品しました。"
    else
      flash.now[:alert] = "必須項目を埋めてください。"
      render :new
    end
    
  end


  #before_actionのメソッド（該当するメソッドに共通する部分）
  def set_good
    @good = Good.find(params[:id])
  end

  def notlogin
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
      {images_attributes: [:goods_picture, :_destroy, :id]}
    ).merge(user_id: current_user.id)
  end

  # 編集が終わった段階で、編集前から存在し、且つ削除されずに残った画像のidが入る。
  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  # こちらには編集時に新たに追加された画像が入る。追加画像はDBのidを持っていないので、idsではなくimagesになる。
  def new_image_params
    params.require(:new_images).permit({images: []})
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
