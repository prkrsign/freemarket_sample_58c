class MypageController < ApplicationController
    
    def mypage
        
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
        # binding.pry
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_path
    end


end
