class AddressesController < ApplicationController
  before_action :authenticate_user!
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
      :postalcode,
      :city,
      :house_number,
      :building_name
    )
  end
end
