class AddressesController < ApplicationController
  def new
    @address = Address.new
    
  end

  def create
    @address = Address.new(address_params)
    if @address.save!
       redirect_to new_card_path
    else
       render 'new'
    end
  end
  private
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
