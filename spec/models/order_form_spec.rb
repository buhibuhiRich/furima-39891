require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報' do
    context '保存できるとき' do
      it '有効な情報が提供されると保存できること' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
    end
    

    context '保存できないとき' do
      it '郵便番号が必須であること' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」の半角文字列であること' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が必須であること' do
        @order_form.shipping_from_region_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Shipping from region can't be blank")
      end

      it '市区町村が必須であること' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が必須であること' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁以上11桁以内の半角数値であること' do
        @order_form.phone_number = '123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
    
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'item_idが空では登録できないこと' do
        @order_form.item_id = nil
        @order_form.token = 'tok_abcdefghijk00000000000000000'  # 仮にtokenに適切な値を設定
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end  
