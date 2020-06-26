require 'rails_helper'

RSpec.describe 'ショップ管理機能', type: :model do
  before do
    @shop_owner1 = FactoryBot.create(:shop_owner)
  #   @shop1 = FactoryBot.create(:shop, shop_owner: @shop_owner1)
  end

  it 'ショップ名が空ならバリデーションが通らない' do
    shop = Shop.new(name: '', introduction: '失敗テスト')
    expect(shop).not_to be_valid
  end
  it '紹介文が空ならバリデーションが通らない' do
    shop = Shop.new(name: '失敗ショップ名', introduction: '')
    expect(shop).not_to be_valid
  end
  it '全ての内容が記載されていればバリデーションが通る' do
    shop = Shop.new(shop_owner: @shop_owner1, name: 'sample1', introduction: 'sample1',
                  postcode: '1234567', prefecture_code: '鹿児島県', address_city: '鹿児島市吉野町',
                  address_street: '1-2-3', phone_number: '09012345678')
    expect(shop).to be_valid
  end
end