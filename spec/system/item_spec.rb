require 'rails_helper'

RSpec.describe '商品登録・編集・削除機能', type: :feature do
  before do
    @user1 = FactoryBot.create(:user)
    @shop_owner1 = FactoryBot.create(:shop_owner)
    @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
    @item1 = FactoryBot.create(:item, shop_id: @shop1.id)
    #itemize
    Itemize.create(shop_id: @shop1.id, item_id: @item1.id)

    visit new_shop_owner_session_path
    fill_in 'Eメール', with: 'sample1@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'Log in'
    visit shop_owner_path(@shop_owner1.id)
  end

  describe '商品登録のテスト' do
    context 'ショップオーナーがログインしている場合' do
      it '新規商品登録のテスト' do
        visit shop_owner_path(@shop_owner1.id)
        click_link '詳細を見る'
        visit shop_path(@shop1.id)
        click_link '商品を登録する'
        fill_in 'item[name]', with: 'sample'
        fill_in 'item[price]', with: '100'
        fill_in 'item[stock]', with: '10'
        fill_in 'item[remark]', with: 'sample'
        click_on 'commit'
        click_on 'commit'
        # binding.pry
        expect(current_path).to eq shop_path(@shop1.id)
      end
      it '商品内容を編集できる' do
        visit shop_path(@shop1.id)
        click_link '編集する', match: :first
        click_on 'commit'
        expect(current_path).to eq shop_owner_path(@shop_owner1.id)
      end
      it '商品を削除できる' do
        visit shop_path(@shop1.id)
        click_link '削除する', match: :first
        expect(current_path).to eq shop_path(@shop1.id)
      end
    end
  end
end