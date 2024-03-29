require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入情報が保存できる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildin_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入情報が保存できない時' do
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ数字でないと保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code は3桁-4桁の半角数字で入力してください。')
      end
      it 'prefecture_idが空では保存できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を入力してください。")
      end
      it 'prefecture_idが1では保存できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を入力してください。")
      end
      it 'municipalitiesが空では保存できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number が短いです。10~11桁で入力してください。')
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '123456789101'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number が短いです。10~11桁で入力してください。')
      end
      it 'phone_numberが半角数字でなければ保存できない' do
        @order_address.phone_number = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字で入力してください。')
      end
      it 'phone_numberが英数字以外が含まれていると保存できない' do
        @order_address.phone_number = '12あいう345えお6'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字で入力してください。')
      end
      it 'tokenが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
