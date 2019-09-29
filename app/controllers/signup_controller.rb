class SignupController < ApplicationController

def step1
    @user = User.new
end

def step2
    @user = User.new(user_params)
    session[:username] = user_params[:username]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_in_katakana] = user_params[:family_name_in_katakana]
    session[:first_name_in_katakana] = user_params[:first_name_in_katakana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
   
end



def create
  @user = User.new(
      username: session[:username],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_in_katakana: session[:family_name_in_katakana],
      first_name_in_katakana: session[:first_name_in_katakana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: user_params[:phone_number]
    )
  if  @user.save
      session[:user_id] = @user.id
      redirect_to new_address_path, notice: "情報を登録しました。"
  else
      flash.now[:alert] = "必須項目をご記入ください。"
      render '/signup/step1'
  end
end


private
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password, 
      :password_confirmation,
      :family_name,
      :first_name,
      :family_name_in_katakana,
      :first_name_in_katakana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number   
    )
  end
  
end


