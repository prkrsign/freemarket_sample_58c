require 'rails_helper'

RSpec.describe Good, type: :model do
  describe '#create' do

    context "can save" do

      # 登録可能(全項目あり)
      it "is valid with all propeties" do
        good = create(:good)
        expect(good).to be_valid
      end

      # 登録可能（全項目あり、境界値：goods_name40文字）
      it "is valid with all propeties and goods_name(40 characters)" do
        good = create(:good, goods_name: Faker::Lorem.characters(number: 40))
        expect(good).to be_valid
      end

      # 登録可能（全項目あり、境界値：goods_description1000文字）
      it "is valid with all propeties and description(1000 characters)" do
        good = create(:good, goods_description: Faker::Lorem.characters(number: 1000))
        expect(good).to be_valid
      end

      # 登録可能（全項目あり、境界値：brand無し）
      it "is valid without brand" do
        good = create(:good, brand_id: nil)
        expect(good).to be_valid
      end

      # 登録可能（全項目あり、境界値：price300）
      it "is valid with all propeties and price(300)" do
        good = create(:good, price: 300)
        expect(good).to be_valid
      end

      # 登録可能（全項目あり、境界値：price9999999）
      it "is valid with all propeties and price(9999999)" do
        good = create(:good, price: 9999999)
        expect(good).to be_valid
      end
    end
  end
end
