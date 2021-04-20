require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる時'
     it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
       expect(@user).to be_valid
     end

    context "新規登録できない時" do
      it "nicknameが空では登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end 
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが英語のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        # テストコード実行→処理が止まったら@user.errors.full_messagesをターミナルで入力
      end

      it "passwordが数字のみでは登録できない" do
        @user.password = '888888'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

      it "passwordが6文字以下では登録できない" do
        @user.password = 'koigf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end

     it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.last_name = 'kd15'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが全角カタカナ以外では登録できない" do
        @user.last_name_kana = '山'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
       @user.first_name = '14kh'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end 
      it "first_name_kanaが全角カタカナ以外では登録できない" do
        @user.first_name_kana = 'やま'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end  
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end  
    end
  end
 
end

