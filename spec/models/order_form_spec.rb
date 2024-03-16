require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先が保存できる場合' do
    context '配送先情報の保存ができるとき' do
      it '必要事項を全ての項目で過不足なく入力すると登録できる' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '配送先が保存できない場合' do
      it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ保存できない' do
        @order_form.postal_code = '1112222'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '郵便番号が空では保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空では保存できない' do
        @order_form.shipment_region_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Shipment region can't be blank", "Shipment region Prefecture can't be blank")
      end

      it '市区町村が空では保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it '電話番号は、10桁以上11桁以内の半角数値でなければ保存できない' do
        @order_form.phone_number = '123-４５６７-8901'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '9桁以下の電話番号で保存できない' do
        @order_form.phone_number = '090'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '12桁以上の電話番号で保存できない' do
        @order_form.phone_number = '1234567890987'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'item_id が空では保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_id が空で は保存できない'do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では保存できない" do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end