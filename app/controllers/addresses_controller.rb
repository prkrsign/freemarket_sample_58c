class AddressesController < ApplicationController
  
  before_action :set_current_user
  def new
    @address = Address.new
    
  end

  def create
    @address = Address.new(new_address_params).merge(user_id: @user.id)
    
    if @address.save!      
       redirect_to new_card_path
    else
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
      :building_name
    )
  end
end
