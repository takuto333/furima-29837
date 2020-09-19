require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,last_name_kanji,first_name_kanji,last_name_katakana,first_name_katakana,berthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ、半角英数混合であれば登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが既に存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下の場合は登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが6文字以上でも数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password please set including both half-width letters and numbers')
      end
      it 'passwordが6文字以上でも英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password please set including both half-width letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが存在しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_name_kanjiが空だと登録できない' do
        @user.last_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'last_name_kanjiが全角文字以外だと登録できない' do
        @user.last_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji Please use full-width-letter')
      end
      it 'first_name_kanjiが空だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'first_name_kanjiが全角文字以外だと登録できない' do
        @user.first_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji Please use full-width-letter')
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'last_name_katakanaが全角カナ以外だと登録できない' do
        @user.last_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana Please use full-width-kana')
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana Please use full-width-kana')
      end
      it 'first_name_katakanaが全角カナ以外だと登録できない' do
        @user.first_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana Please use full-width-kana')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
