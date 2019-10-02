class MypageController < ApplicationController
    before_action :set_current_user
    def mypage
        # binding.pry
        # @user = @current_user
        # @user = User.find(current_user.id)
    end

    def put_up_goods_on_sale
        @user = User.find(current_user.id)
    end

    def purchased_on_deal
        @user = User.find(current_user.id)
    end

    def edit_profile

    end

    def credit_enter

    end

    def make_sure_user_info

    end

    def credit_register

    end
    
    def logout
    
    end

    def signout
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_path
    end

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
