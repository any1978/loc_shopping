require 'rails_helper'

RSpec.describe '商品管理機能', type: :model do

  it '商品名が空ならバリデーションが通らない' do
    item = Item.new(name: '', remark: '失敗テスト')
    expect(item).not_to be_valid
  end
  it '紹介文が空ならバリデーションが通らない' do
    item = Item.new(name: '失敗商品名', remark: '')
    expect(item).not_to be_valid
  end
  it '全ての内容が記載されていればバリデーションが通る' do
    item = Item.new(name: 'sample1', remark: 'sample1', price: '100',
                  stock: '10')
    expect(item).to be_valid
  end
end