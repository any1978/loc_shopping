require 'rails_helper'

RSpec.describe 'ショップ管理機能', type: :feature do
  before do
    @shop_owner1 = FactoryBot.create(:shop_owner)
    @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
    #ログイン
    visit new_shop_owner_session_path
    fill_in 'Eメール', with: 'sample1@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'Log in'
  end
  describe 'マイショップ一覧画面' do
    context 'ショップを登録した場合' do
      it '登録済みのショップが表示される' do
        visit shop_owner_path(@shop_owner1.id)
        expect(page).to have_content 'sample1'
      end
    end
  end
  describe 'ショップ登録画面' do
    context '必要項目を入力して、店舗情報作成ボタンを押した場合' do
      it 'ショップが登録される' do
        visit shop_owner_path(@shop_owner1.id)
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
  describe 'ショップ詳細画面' do
    context '任意のショップ詳細画面に遷移した場合' do
      it '該当ショップの内容が表示されたページが表示される' do
        visit shop_owner_path(@shop_owner1.id)
        click_link '詳細を見る'
        visit shop_path(@shop1.id)
        # binding.pry
        expect(page).to have_content 'ショップページ'
        expect(page).to have_content '商品一覧'
      end
    end
    context '編集ボタンをクリックした場合' do
      it '該当ショップが編集される' do
        visit shop_owner_path(@shop_owner1.id)
        click_link '編集する'
        click_button 'commit'
        expect(page).to have_content 'ショップ情報を編集しました！'
      end
    end
    context '削除ボタンをクリックした場合' do
      it '該当ショップが削除される' do
        visit shop_owner_path(@shop_owner1.id)
        click_link '削除する'
        expect(page).to have_content 'ショップを削除しました！'
      end
    end
  end
  describe 'ショップ一覧画面' do
    context '検索ボックスで検索した場合' do
      before do
        @shop_owner2 = FactoryBot.create(:second_shop_owner)
        @shop2 = FactoryBot.create(:second_shop, shop_owner: @shop_owner2)
      end
      it '該当エリアのショップが表示される' do
        visit shops_path
        fill_in "search", with: "杉並区高円寺北"
        click_button "検索"
        # expect(page).to include(@shop2.name)
        # expect(page).to have_content 'sample2'
        # expect(page).to have_content '杉並区下高井戸'
      end
    end
  end
  DatabaseCleaner.clean
end