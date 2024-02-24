require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '有効な情報が提供されると登録できること' do
        expect(@user).to be_valid
      end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'password456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが6文字以上でないと登録できない' do
        @user.password = 'pass'
        @user.password_confirmation = 'pass'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は少なくとも1つの英字を含む必要があります")
      end
      
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は少なくとも1つの数字を含む必要があります")
      end
      

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = "あいうえお"
        @user.password_confirmation = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は少なくとも1つの英字を含む必要があります", "Password は少なくとも1つの数字を含む必要があります", "Password は全角文字を含んではいけません")
      end
     
      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓カナ（全角）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名カナ（全角）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  


    context '新規登録できないとき' do

    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it '姓カナ（カタカナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it '名カナ（カタカナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end
