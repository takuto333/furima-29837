require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image,name,description,category_id,condition_id,shipping_charges_id,shipping_area_id,days_to_ship_id,priceが存在すれば登録できる。' do
      expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageがなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがなければ登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionがなければ登録できない'do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipping_charges_idが1だと登録できない' do
        @item.shipping_charges_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it 'shipping_area_idが1だと登録できない' do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'priceがなければ登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと登録できない'do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000円以上だと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外だと保存されない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
