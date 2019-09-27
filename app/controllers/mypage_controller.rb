class MypageController < ApplicationController
    def mypage
        @user = User.find(current_user.id)
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

end
