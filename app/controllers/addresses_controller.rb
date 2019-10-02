class AddressesController < ApplicationController
  
  before_action :set_current_user
  def new
    @address = Address.new
    
  end

  def create
    info = {}
    @user = current_user
    info[:user_id] = @user.id
    new_address_params = address_params.merge(info)
    @address = Address.new(new_address_params)
    
    if @address.save
       redirect_to new_card_path, notice: "情報を登録しました。"

    else
       flash.now[:alert] = "必須項目をご記入ください。"
       render 'new'
    end
  end
  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end


  def address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :postalcode,
      :city,
      :house_number,
      :building_name,
      :phone_number,
      :prefecture_id
    )
  end
end
