require 'rails_helper'

RSpec.describe 'ショップ管理機能', type: :feature do
  before do
    # @user1 = FactoryBot.create(:user)
    # @user2 = FactoryBot.create(:second_user)

    @shop_owner1 = FactoryBot.create(:shop_owner)
    # @shop_owner2 = FactoryBot.create(:second_shop_owner)

    @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
    # @shop2 = FactoryBot.create(:second_shop, shop_owner: @shop_owner2)

    # @item1 = FactoryBot.create(:item, shop_id: @shop1.id)
    # @item2 = FactoryBot.create(:second_item, shop_id: @shop2.id)
    
    #itemize
    # Itemize.create(shop_id: @shop1.id, item_id: @item1.id)
    # Itemize.create(shop_id: @shop2.id, item_id: @item2.id)

    #ログイン
    visit new_shop_owner_session_path
    fill_in 'Eメール', with: 'sample1@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'Log in'
  end
  # describe 'マイショップ一覧画面' do
  #   context 'ショップを登録した場合' do
  #     it '登録済みのショップが表示される' do
  #       visit shop_owner_path(@shop_owner1.id)
  #       expect(page).to have_content 'sample1'
  #     end
  #   end
  # end
  describe 'ショップ登録画面' do
    context '必要項目を入力して、店舗情報作成ボタンを押した場合' do
      it 'ショップが登録される' do
        visit shop_path(@shop_owner1.id)
        click_on '店舗情報作成'
        # expect(page).to have_content 'ショップ情報登録画面'
        # binding.pry
        fill_in "shop[name]", with: "sample"
        fill_in "shop[introduction]", with: "sample"
        fill_in "shop[postcode]", with: "1234567"
        fill_in "shop[prefecture_code]", with: "鹿児島県"
        fill_in "shop[address_city]", with: "鹿児島市吉野町"
        fill_in "shop[address_street]", with: "1-2-3"
        fill_in "shop[phone_number]", with: '09012345678'
        click_button 'commit'
        expect(page).to have_content "鹿児島市吉野町"
      end
    end
  end
  # describe 'ショップ詳細画面' do
  #   context '任意のショップ詳細画面に遷移した場合' do
  #     it '該当ショップの内容が表示されたページに遷移する' do
  #       # binding.pry
  #       visit task_path(id: 1)
  #       expect(page).to have_content 'sampleタイトル1'
  #       expect(page).to have_content 'sampleコンテント1'
  #       expect(page).to have_content '2020年06月20日'
  #       expect(page).to have_content '未着手'
  #       expect(page).to have_content 'High'
  #       expect(page).to have_content "0"
  #     end
  #   end
  # end
  DatabaseCleaner.clean
end