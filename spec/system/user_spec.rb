require 'rails_helper'

RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :feature do
  before do
    @user1 = FactoryBot.create(:user)
    # @user2 = FactoryBot.create(:second_user)

    @shop_owner1 = FactoryBot.create(:shop_owner)
    @shop_owner2 = FactoryBot.create(:second_shop_owner)

    @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
    @shop2 = FactoryBot.create(:second_shop, shop_owner: @shop_owner2)

    @item1 = FactoryBot.create(:item, shop_id: @shop1.id)
    @item2 = FactoryBot.create(:second_item, shop_id: @shop2.id)
    
    #itemize
    Itemize.create(shop_id: @shop1.id, item_id: @item1.id)
    Itemize.create(shop_id: @shop2.id, item_id: @item2.id)
  end

  # describe 'ユーザ登録のテスト' do
  #   # context 'ユーザのデータがなくログインしていない場合' do
  #   #   it 'ユーザ新規登録のテスト' do
  #   #     visit new_user_registration_path
  #   #     fill_in 'user[first_name]', with: 'sample'
  #   #     fill_in 'user[last_name]', with: 'sample'
  #   #     fill_in 'user[email]', with: 'sample@example.com'
  #   #     fill_in 'user[password]', with: '00000000'
  #   #     fill_in 'user[password_confirmation]', with: '00000000'
  #   #     fill_in 'user[postcode]', with: '1234567'
  #   #     fill_in 'user[prefecture_code]', with: '鹿児島県'
  #   #     fill_in 'user[address_city]', with: '鹿児島市吉野町'
  #   #     fill_in 'user[address_street]', with: '1-2-3'
  #   #     fill_in 'user[address_building]', with: 'sample'
  #   #     fill_in 'user[phone_number]', with: '09012345678'
  #   #     click_on 'Sign up'
  #   #     # binding.pry
  #   #     expect(current_path).to eq shops_path
  #   #   end
  #   # end
  #   context 'ユーザのデータがなくログインしていない場合' do
  #     it 'ログインしていない時はログイン画面に飛ぶテスト' do
  #       visit shops_path
  #       click_on 'ショップを見る', match: :first
  #       # visit shop_path(@shop1)
  #       # binding.pry
  #       click_on 'カートに入れる'
  #       expect(current_path).to eq new_user_session_path
  #     end
  #   end
  # end
  describe 'セッション機能のテスト' do
    context 'ユーザのデータがある場合' do
      it 'ログインしてショップ一覧ページに飛べること' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'sample1@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'Log in'
        # user = User.last
        expect(current_path).to eq shops_path
      end
  # #     it 'ログアウトができること' do
  # #       visit new_session_path
  # #       fill_in 'Email', with: 'sample@example.com'
  # #       fill_in 'Password', with: '00000000'
  # #       click_on 'Log in'
  # #       user = User.last
  # #       visit tasks_path
  # #       click_on 'Logout'
  # #       expect(current_path).to eq new_session_path
  # #     end
    end
  end
  # describe '管理画面のテスト' do
  #   context '管理者は' do
  #     it '管理画面にアクセスできること' do
  #       create(:admin_user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'admin@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       user = User.last
  #       visit admin_users_path(id: 2)
  #       expect(page).to have_content 'ユーザー管理画面'
  #     end
  #     it '一般ユーザは管理画面にアクセスできないこと' do
  #       create(:user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'sample@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       visit admin_users_path(id: 1)
  #       expect(page).to have_content 'あなたは管理者ではありません'
  #     end
  #     it 'ユーザーを新規登録できること' do
  #       create(:admin_user)
  #       create(:second_user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'admin@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       user = User.last
  #       visit admin_users_path(id: 2)
  #       expect(page).to have_content 'ユーザー管理画面'
  #       click_on 'New User'
  #       fill_in 'user[user_name]', with: 'sample10'
  #       fill_in 'user[email]', with: 'sample10@example.com'
  #       fill_in 'user[password]', with: '00000000'
  #       fill_in 'user[password_confirmation]', with: '00000000'
  #       click_on 'Create account'
  #       user = User.last
  #       expect(page).to have_content 'User was successfully created.'
  #     end
  #     it 'ユーザーの詳細画面にアクセスできること' do
  #       create(:admin_user)
  #       create(:second_user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'admin@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       user = User.last
  #       visit admin_users_path(id: 2)
  #       expect(page).to have_content 'ユーザー管理画面'
  #       all('tbody tr')[1].click_on 'Show'
  #       user = User.last
  #       expect(current_path).to eq admin_user_path(user)
  #     end
  #     it 'ユーザの編集画面からユーザを編集できること' do
  #       create(:admin_user)
  #       create(:second_user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'admin@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       user = User.last
  #       visit admin_users_path(id: 2)
  #       expect(page).to have_content 'ユーザー管理画面'
  #       all('tbody tr')[1].click_on 'Edit'
  #       fill_in 'user[user_name]', with: 'sample10'
  #       fill_in 'user[email]', with: 'sample10@example.com'
  #       fill_in 'user[password]', with: '00000000'
  #       fill_in 'user[password_confirmation]', with: '00000000'
  #       click_on 'Update account'
  #       user = User.last
  #       expect(current_path).to eq user_path(user)
  #       expect(page).to have_content 'User was successfully updated.'
  #     end
  #     it '他のユーザを削除できること' do
  #       create(:admin_user)
  #       create(:second_user)
  #       visit new_session_path
  #       fill_in 'Email', with: 'admin@example.com'
  #       fill_in 'Password', with: '00000000'
  #       click_on 'Log in'
  #       user = User.last
  #       visit admin_users_path(id: 2)
  #       expect(page).to have_content 'ユーザー管理画面'
  #       page.accept_confirm do
  #         all('tbody tr')[1].click_on 'Destroy'
  #       end
  #       expect(page).to have_content 'ユーザー「sample2」を削除しました'
  #     end
  #   end
  # end
end