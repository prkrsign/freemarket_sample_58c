require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#create' do
      it "username無しの場合登録ができない" do
        user = User.new(username: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
        user.valid?
        expect(user.errors[:username]).to include("can'tbe blank")
     end
   end
end
