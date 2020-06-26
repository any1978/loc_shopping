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

  describe 'お気に入りショップ登録のテスト' do
    context 'ユーザーがログインしている場合' do
      it 'お気に入り登録のテスト' do
        visit shops_path
        click_link 'ショップを見る'
        click_on 'お店をお気に入りに登録する'
        expect(page).to have_content "sample1をお気に入り登録しました"
      end
      it 'お気に入り一覧を見る' do
        visit shops_path
        click_link 'ショップを見る'
        click_on 'お店をお気に入りに登録する'
        click_on 'お気に入りのお店一覧を見る'
        expect(page).to have_content "sample1"
      end
      it 'お気に入りを解除する' do
        visit shops_path
        click_link 'ショップを見る'
        click_on 'お店をお気に入りに登録する'
        click_on 'お気に入り解除する'
        expect(current_path).to eq shop_path(@shop1.id)
      end
    end
  end
end