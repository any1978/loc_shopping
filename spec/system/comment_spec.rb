require 'rails_helper'

RSpec.describe '商品登録・編集・削除機能', type: :feature do
  before do
    @user1 = FactoryBot.create(:user)
    @shop_owner1 = FactoryBot.create(:shop_owner)
    @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
    @item1 = FactoryBot.create(:item, shop_id: @shop1.id)
    #itemize
    Itemize.create(shop_id: @shop1.id, item_id: @item1.id)

    visit new_user_session_path
    fill_in 'Eメール', with: 'sample1@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'Log in'
    visit shops_path
  end

  describe 'コメント投稿のテスト' do
    # render_views
    context 'ユーザーがログインしている場合' do
      it 'コメントを投稿できる' do
        visit shops_path
        click_link 'ショップを見る'
        fill_in 'comment[content]', with: 'こんにちは'
        click_on 'commit'
        visit shop_path(@shop1.id)
        expect(page).to have_content "さんのメッセージ"
      end
      it 'コメントを削除できる' do
        visit shops_path
        click_link 'ショップを見る'
        fill_in 'comment[content]', with: 'こんにちは'
        click_on 'commit'
        visit shop_path(@shop1.id)
        first(:css, ".delete_link").click
        expect(page).to have_content "sample1"
      end
    end
  end
end