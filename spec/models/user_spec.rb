require 'rails_helper'

RSpec.describe User, type: :model do

    describe '#create' do

      it "全ての必須項目を入れた場合、アカウント登録ができる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "username無しの場合、登録ができない" do
        user = build(:user, username: nil)
        user.valid?
        expect(user.errors[:username]).to include("値は1文字以上で入力してください", "値を入力してください")
      end

     it "usernameが10文字を超える場合、登録ができない" do
      user = build(:user, username:  "abcdefghijk")
      user.valid?
      expect(user.errors[:username]).to include("値は10文字以内で入力してください")
     end

     it "usernameが2文字以上10文字以内の場合、登録ができる" do
      user = build(:user)
      expect(user).to be_valid
     end

     it "emailに入力がない場合、登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("値を入力してください", "は不正な値です")
     end

     it "同じemailがすでにDBに登録されている場合、登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
     end

     it "emailのフォーマットに準拠していない場合、登録できない" do
      user = build(:user, email: 'aaaa')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
     end

     it "emailの@以前に値がない場合、登録できない" do
      user = build(:user, email: '@aaa')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
     end

     it "emailの@以降に値がない場合、登録できない" do
      user = build(:user, email: 'aaaa@')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
     end

     it "emailにカナ文字が含まれる場合、登録できない" do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがnilの場合、登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("値を入力してください")
    end

    # 確認passwordがnilの場合のバリデーションは存在しないが、passwordではnilを許さないため問題ないと判断する(神山)
    it "確認passwordとpasswordが一致しない場合、登録できない" do
      user = build(:user, password_confirmation: 'aaaa')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "確認passwordとpasswordが一致しない場合、登録できない" do
      user = build(:user, password_confirmation: 'aaaa')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "passwordとpasswordが7桁以下の場合、登録できない" do
      user = build(:user, password: 'aaabbb')
      user.valid?
      expect(user.errors[:password]).to include("値は7文字以上で入力してください")
    end

   end
end
