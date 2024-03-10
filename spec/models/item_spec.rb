require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全ての項目で過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空欄だと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'category_idが「---」だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idが「---」だと出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'shipping_charge_idが「---」だと出品できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipment_region_idが「---」だと出品できない' do
        @item.shipment_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment region can't be blank")
      end

      it 'days_to_ship_idが「---」だと出品できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it '価格が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '3５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end