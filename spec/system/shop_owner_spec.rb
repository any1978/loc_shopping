require 'rails_helper'

RSpec.describe 'ショップオーナー登録・ログイン・ログアウト機能', type: :feature do
  describe 'ショップオーナー登録のテスト' do
    context 'ショップオーナーのデータがなくログインしていない場合' do
      it 'ショップオーナー新規登録のテスト' do
        visit new_shop_owner_registration_path
        fill_in 'shop_owner[first_name]', with: 'sample'
        fill_in 'shop_owner[last_name]', with: 'sample'
        fill_in 'shop_owner[email]', with: 'sample@example.com'
        fill_in 'shop_owner[password]', with: '00000000'
        fill_in 'shop_owner[password_confirmation]', with: '00000000'
        fill_in 'shop_owner[postcode]', with: '1234567'
        fill_in 'shop_owner[prefecture_code]', with: '鹿児島県'
        fill_in 'shop_owner[address_city]', with: '鹿児島市吉野町'
        fill_in 'shop_owner[address_street]', with: '1-2-3'
        fill_in 'shop_owner[address_building]', with: 'sample'
        fill_in 'shop_owner[phone_number]', with: '09012345678'
        fill_in 'shop_owner[number_of_store]', with: '1'
        click_on 'Sign up'
        shop_owner= ShopOwner.last
        expect(current_path).to eq shop_owner_path(shop_owner.id)
      end
    end
  end
  describe 'セッション機能のテスト' do
    before do
      @shop_owner1 = FactoryBot.create(:shop_owner)
      @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
      @item1 = FactoryBot.create(:item, shop_id: @shop1.id)
      #itemize
      Itemize.create(shop_id: @shop1.id, item_id: @item1.id)
    end
    context 'ショップオーナーのデータがある場合' do
      it 'ログインしてショップ一覧ページに飛べること' do
        visit new_shop_owner_session_path
        fill_in 'Eメール', with: 'sample1@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'Log in'
        # shop_owner = shop_owner.last
        expect(current_path).to eq shop_owner_path(@shop_owner1.id)
      end
      it 'ログアウトができること' do
        visit new_shop_owner_session_path
        fill_in 'Eメール', with: 'sample1@example.com'
        fill_in 'パスワード', with: '00000000'
        click_on 'Log in'
        click_on 'ログアウト'
        expect(current_path).to eq root_path
      end
    end
  end
end