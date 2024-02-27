require 'rails_helper'

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '登録できるとき' do
      it '有効な情報が提供されると登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品情報登録できないとき' do
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
     
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
  
      
      it 'condition_idが初期値だと登録できない' do
        @item.condition_id = Condition.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  
      it 'shipping_cost_responsibility_idが初期値だと登録できない' do
        @item.shipping_cost_responsibility_id = ShippingCostResponsibility.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost responsibility can't be blank")
      end
  
      it 'shipping_from_region_idが初期値だと登録できない' do
        @item.shipping_from_region_id = ShippingFromRegion.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from region can't be blank")
      end
  
      it 'days_until_shipment_idが初期値だと登録できない' do
        @item.days_until_shipment_id = DaysUntilShipment.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipment can't be blank")
      end
    
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end  

      it '価格が¥299以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が¥10,000,000以上では登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end  
  
      it '価格が半角数値以外では登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
