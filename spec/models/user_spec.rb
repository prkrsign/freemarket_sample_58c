require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'ユーザー新規登録' do
      it "全ての必須項目を入れた場合、アカウント登録ができる" do
        user = build(:user)
        expect(user).to be_valid
      end

      describe 'ユーザー新規登録(username)' do
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
      end

      describe 'ユーザー新規登録(email)' do
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
      end

      describe 'ユーザー新規登録(password)' do
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

        it "passwordが7桁以下の場合、登録できない" do
          user = build(:user, password: 'aaabbb')
          user.valid?
          expect(user.errors[:password]).to include("値は7文字以上で入力してください")
        end

        it "passwordが20桁以上の場合、登録できない" do
          user = build(:user, password: 'aaabbbcccdddeeefffggg')
          user.valid?
          expect(user.errors[:password]).to include("値は20文字以内で入力してください")
        end

        it "passwordが20桁以上の場合、登録できない" do
          user = build(:user, password: 'aaabbbcccdddeeefffggg')
          user.valid?
          expect(user.errors[:password]).to include("値は20文字以内で入力してください")
        end
      end

      describe 'ユーザー新規登録(phone_number)' do
        it "phone_numberがnilの場合、登録できない" do
          user = build(:user, phone_number: '')
          user.valid?
          expect(user.errors[:phone_number]).to include("値を入力してください")
        end

        it "phone_numberが数字でない場合、登録できない" do
          user = build(:user, phone_number: 'aaabbbbcccc')
          user.valid?
          expect(user.errors[:phone_number]).to include("は数値で入力してください")
        end

        it "phone_numberのフォーマットに準拠していない場合、登録できない" do
          user = build(:user, phone_number: '0a011112222')
          user.valid?
          expect(user.errors[:phone_number]).to include("は不正な値です")
        end

        it "phone_numberにハイフンを含む場合、登録できない" do
          user = build(:user, phone_number: '090-1111-2222')
          user.valid?
          expect(user.errors[:phone_number]).to include("は不正な値です")
        end

        it "phone_numberが9桁以下の場合、登録できる" do
          user = build(:user, phone_number: '000111222')
          user.valid?
          expect(user.errors[:phone_number]).to include("は不正な値です")
        end

        it "phone_numberが12桁以上の場合、登録できない" do
          user = build(:user, phone_number: '000011112222')
          user.valid?
          expect(user.errors[:phone_number]).to include("は不正な値です")
        end

        it "phone_numberが10桁の場合、登録できる" do
          user = build(:user, phone_number: '0001112222')
          user.valid?
          expect(user).to be_valid
        end

        it "phone_numberが11桁の場合、登録できる" do
          user = build(:user, phone_number: '09011112222')
          user.valid?
          expect(user).to be_valid
        end
      end

      describe 'ユーザー新規登録(family_name)' do
        it "family_nameが10文字以内の場合、登録できる" do
          user = build(:user, family_name: 'あああああいいいいい')
          user.valid?
          expect(user).to be_valid
        end

        it "family_nameが11文字以上の場合、登録できない" do
          user = build(:user, family_name: 'あああああいいいいいう')
          user.valid?
          expect(user.errors[:family_name]).to include("値は10文字以内で入力してください")
        end

        it "family_nameがnilの場合、登録できない" do
          user = build(:user, family_name: nil)
          user.valid?
          expect(user.errors[:family_name]).to include("値を入力してください")
        end
      end

      describe 'ユーザー新規登録(first_name)' do
        it "first_nameが10文字以内の場合、登録できる" do
          user = build(:user, first_name: 'あああああいいいいい')
          user.valid?
          expect(user).to be_valid
        end

        it "first_nameが11文字以上の場合、登録できない" do
          user = build(:user, first_name: 'あああああいいいいいう')
          user.valid?
          expect(user.errors[:first_name]).to include("値は10文字以内で入力してください")
        end

        it "first_nameがnilの場合、登録できない" do
          user = build(:user, first_name: nil)
          user.valid?
          expect(user.errors[:first_name]).to include("値を入力してください")
        end
      end

      describe 'ユーザー新規登録(family_name_in_katakana)' do
        it "family_name_in_katakanaが15文字以内の場合、登録できる" do
          user = build(:user, family_name_in_katakana: 'アアアアアイイイイイウウウウウ')
          user.valid?
          expect(user).to be_valid
        end

        it "family_name_in_katakanaがnilの場合、登録できる" do
          user = build(:user, family_name_in_katakana: nil)
          user.valid?
          expect(user.errors[:family_name_in_katakana]).to include("値を入力してください")
        end

        it "family_name_in_katakanaが16文字以上の場合、登録できない" do
          user = build(:user, family_name_in_katakana: 'アアアアアイイイイイウウウウウエ')
          user.valid?
          expect(user.errors[:family_name_in_katakana]).to include("値は15文字以内で入力してください")
        end

        it "family_name_in_katakanaがひらがなの場合、登録できない" do
          user = build(:user, family_name_in_katakana: 'あああああいいいいいううううう')
          user.valid?
          expect(user.errors[:family_name_in_katakana]).to include("はカナ文字を入力してください")
        end

        it "family_name_in_katakanaが漢字の場合、登録できない" do
          user = build(:user, family_name_in_katakana: '一二三四五')
          user.valid?
          expect(user.errors[:family_name_in_katakana]).to include("はカナ文字を入力してください")
        end

        it "family_name_in_katakanaがアルファベットの場合、登録できない" do
          user = build(:user, family_name_in_katakana: 'abcde')
          user.valid?
          expect(user.errors[:family_name_in_katakana]).to include("はカナ文字を入力してください")
        end
      end

      describe 'ユーザー新規登録(first_name_in_katakana)' do
        it "first_name_in_katakanaが15文字以内の場合、登録できる" do
          user = build(:user, first_name_in_katakana: 'アアアアアイイイイイウウウウウ')
          user.valid?
          expect(user).to be_valid
        end

        it "first_name_in_katakanaがnilの場合、登録できる" do
          user = build(:user, first_name_in_katakana: nil)
          user.valid?
          expect(user.errors[:first_name_in_katakana]).to include("値を入力してください")
        end

        it "first_name_in_katakanaが16文字以上の場合、登録できない" do
          user = build(:user, first_name_in_katakana: 'アアアアアイイイイイウウウウウエ')
          user.valid?
          expect(user.errors[:first_name_in_katakana]).to include("値は15文字以内で入力してください")
        end

        it "first_name_in_katakanaがひらがなの場合、登録できない" do
          user = build(:user, first_name_in_katakana: 'あああああいいいいいううううう')
          user.valid?
          expect(user.errors[:first_name_in_katakana]).to include("はカナ文字を入力してください")
        end

        it "first_name_in_katakanaが漢字の場合、登録できない" do
          user = build(:user, first_name_in_katakana: '一二三四五')
          user.valid?
          expect(user.errors[:first_name_in_katakana]).to include("はカナ文字を入力してください")
        end

        it "first_name_in_katakanaがアルファベットの場合、登録できない" do
          user = build(:user, first_name_in_katakana: 'abcde')
          user.valid?
          expect(user.errors[:first_name_in_katakana]).to include("はカナ文字を入力してください")
        end
      end

      # 存在しない生年月日が選択された場合登録できないように、signup_controllerに記述しました(神山)
      describe 'ユーザー新規登録(birth_year)' do
        it "birth_yearがnilの場合、登録できない" do
          user = build(:user, birth_year: nil)
          user.valid?
          expect(user.errors[:birth_year]).to include("値を入力してください")
        end
      end

      # 存在しない生年月日が選択された場合登録できないように、signup_controllerに記述しました(神山)
      describe 'ユーザー新規登録(birth_month)' do
        it "birth_monthがnilの場合、登録できない" do
          user = build(:user, birth_month: nil)
          user.valid?
          expect(user.errors[:birth_month]).to include("値を入力してください")
        end        
      end

      # 存在しない生年月日が選択された場合登録できないように、signup_controllerに記述しました(神山)
      describe 'ユーザー新規登録(birth_date)' do
        it "birth_dateがnilの場合、登録できない" do
          user = build(:user, birth_date: nil)
          user.valid?
          expect(user.errors[:birth_date]).to include("値を入力してください")
        end
      end

   end
end
