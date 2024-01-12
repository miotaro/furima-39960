require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_rubyとlast_name_ruby、birthday
          が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_rubyが空では登録できない" do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it "last_name_rubyが空では登録できない" do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end
      it "bithdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end