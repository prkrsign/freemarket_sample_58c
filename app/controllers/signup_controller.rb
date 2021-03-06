class SignupController < ApplicationController
  prepend_before_action :user_params, only: [:create]
  prepend_before_action :check_recaptcha, only: [:create]

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
    session[:birth_date] = user_params[:birth_date]
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
      birth_date: session[:birth_date],
      phone_number: user_params[:phone_number]
    )

  if Date.valid_date?(@user.birth_year.to_i, @user.birth_month.to_i, @user.birth_date.to_i)
    if  @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to new_address_path, notice: "情報を登録しました。"
    else
        flash.now[:alert] = "情報の登録ができませんでした。"
        render step1_signup_index_path, method: :get
    end
  
  else 
    flash.now[:alert] = "存在しない日付です。"
    render  step1_signup_index_path, method: :get
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
      :birth_date,
      :phone_number   
    )
  end

  # ロボットにチェックが入っているか確認する
  def check_recaptcha
    @user = User.new(user_params)
    if verify_recaptcha
      return @user
    else
      render  step2_signup_index_path
    end
  end
end


