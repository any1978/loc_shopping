require 'rails_helper'

RSpec.describe 'カート機能', type: :feature do
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

  describe 'カートのテスト' do
    # render_views
    context 'ユーザーがログインしている場合' do
      it 'カートに商品を入れることができる' do
        visit shops_path
        click_link 'ショップを見る'
        click_button 'カートに入れる'
        visit shop_path(@shop1.id)
        visit current_path
        expect(page).to have_content "カートの内容"
      end
      it 'カートを削除できる' do
        visit shops_path
        click_link 'ショップを見る'
        click_button 'カートに入れる'
        visit shop_path(@shop1.id)
        visit current_path
        click_button 'カートを空にする'
        visit current_path
        # expect(page).to have_content "カートが空になりました"
        expect(current_path).to eq shop_path(@shop1.id)
      end
      it '注文できる' do
        visit shops_path
        click_link 'ショップを見る'
        click_button 'カートに入れる'
        visit shop_path(@shop1.id)
        visit current_path
        click_button '注文する'
        # expect(page).to have_content "カートが空になりました"
        expect(current_path).to eq new_order_path
      end
    end
  end
end