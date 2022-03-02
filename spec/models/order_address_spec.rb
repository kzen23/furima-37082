require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入記録と住所の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存ができる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '保存ができないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid.Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture(都道府県)を選択していないと保存できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityの値が空だと保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesの値が空だと保存できない' do
        @order_address.addresses = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberの値が空だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberの値は、半角数字でないと保存できない' do
        @order_address.phone_number = "0901234567８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberは、10桁以上、11桁以内の番号でないと保存できない(11桁以上)' do
        @order_address.phone_number = "012012345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberは、10桁以上、11桁以内の番号でないと保存できない(10桁より小さい)' do
        @order_address.phone_number = "050042839"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'tokenの値が空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
