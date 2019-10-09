require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'アドレスを新規登録する時' do
    it "全ての必須項目を入れた場合、アカウント登録ができる" do
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end
  end

  describe 'アドレスを新規登録する時(family_name)' do
    it "family_nameに値が入っていない場合、アカウント登録ができない" do
      address = build(:address, family_name: nil )
      address.valid?
      expect(address.errors[:family_name]).to include("値を入力してください")
    end

    it "family_nameが11文字以上の場合、アカウント登録ができない" do
      address = build(:address, family_name: 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ' )
      address.valid?
      expect(address.errors[:family_name]).to include("値は10文字以内で入力してください")
    end
  end

  describe 'アドレスを新規登録するとき(first_name)' do 
    it "first_nameに値が入っていない場合、アカウントが登録できない" do
      address = build(:address, first_name: nil )
      address.valid?
      expect(address.errors[:first_name]).to include("値を入力してください")
    end

    it "first_nameが11文字以上の場合、アカウントが登録できない" do
      address = build(:address, first_name: 'メルメルメルメルメルメルメル')
      address.valid?
      expect(address.errors[:first_name]).to include("値は10文字以内で入力してください")
    end
  end



end
