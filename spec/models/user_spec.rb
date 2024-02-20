require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録できるとき' do
    it 'ユーザーが正常に登録できること' do
      user = FactoryBot.build(
        :user,
        nickname: 'test_nickname',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        first_name: '山',
        last_name: '太郎',
        first_name_kana: 'ヤマ',
        last_name_kana: 'タロウ',
        birth_date: Date.new(2000, 1, 1)
      )
      expect(user).to be_valid
    end
  end
  
  describe 'ユーザー新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = 'test@example'
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
      @user.password_confirmation = 'pass'  # ここで再設定
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードが半角英数字以外だと登録できない' do
      @user.password = 'パスワード１２３'  # 半角英数字以外のパスワード
      @user.password_confirmation = 'パスワード１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password は無効です。英字と数字の両方を含めてください")
    end
    it 'お名前(全角)が名字と名前が空では登録できない' do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
    end  
    it 'お名前カナ(全角)が空では登録できない' do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
    end
    it '生年月日が空では登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
  
  