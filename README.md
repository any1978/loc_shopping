# README


## 製品名
地元のお店でお買い物アプリ

## バージョン
Ruby 2.6.5 　Ruby on Rails 5.2.4

## カタログ設計
https://docs.google.com/spreadsheets/d/1R6-2a3fB4_jza0yY65ln3qtAtvPhA5k00PY3daSqVvU/edit?usp=sharing


## 製品概要
近年、気軽に買い物に行けない、近くに買い物をするお店がない買い物弱者に対する取り組みとして大型スーパーによる移動販売等が実施されている。
しかしながら、地域にはスーパー等のチェーン店以外にも、従来より地域のコミュニケーションの場として活躍してきた商店街等の個人商店が多数存在する。
しかし、資本力に乏しい個人商店が大型スーパーと同じような取組みををするのは難しいと考えられる。
個人店には大型スーパーとは違う個性がある。地域に根ざした人と人とのふれあいという魅力がある。
そういった地元の個人商店でのお買い物をwebショップを通して楽しんでほしいという思いから今回のアプリを考案しました。
少しでも実店舗での買い物に近づけるため、コメント機能等を実装する。コミュニケーションを楽しむきっかけになればと考えています。
webショップを通して、店主とユーザーの間でコミュニケーションが生まれることで、
ユーザーの買い物利便性の向上、個人商店の売上アップを狙う。結果、地域の活性化にも繋がるアプリを制作できればと思います。


## 機能一覧
 
| #	| 機能	|目的	|重要度|
|:-----------|------------:|:------------:|:------------:|
|1	|ユーザーの地元のお店を紹介	|配達利便性のため、ユーザーの住所になるべく近い店舗を紹介 ※geocorder|	高|
|2|	店舗一覧|	[user]  ユーザーの住所の近辺のお店の一覧を紹介するため|	高|
|3|	商品紹介|	[user]  店舗にどんな商品があるか確認するため	|高|
|4|	店舗紹介|	各店舗のオーナーや特徴、強みを紹介するため|	高|
|5|	買い物（お会計）|	[user] web上で商品を購入するため|	高|
|6|	決済機能	|[user] クレジットカード決済、代金引換選択|	低|
|7	|購入履歴確認機能	|[user] 購入履歴を確認できる|	低|
|8|	配達日時選択機能	|[user] 配達してほしい日時を選択|	低|
|9	|クイック電話（お店の電話登録）|	[user]  店主とコミュニケーションをとるため。	|低|
|10	|コメント機能	|[user]  店主とコミュニケーションをとるため。	|中|
|11	|店舗フォロー機能|	[user]  好きな店舗をフォローできる	|高|
|12|	検索機能|	[user]  商品を検索できる	|低|
|13|	商品ジャンル絞り込み機能|	[user]  ジャンルで絞り込んで商品を紹介	|低|
|14|	並び替え機能|	[user]  価格順で商品を並び替えできる	|低|
|15	|ユーザー登録（signup）|	[user] メール、住所、電話番号登録、パスワード	|高|
|16|	ユーザー ログイン|	[user] メール、パスワード	|高|
|17	|店舗オーナー登録|	[オーナー] 登録、メール、住所、電話番号登録、パスワード	|高|
|18	|店舗オーナーログイン	|[オーナー] メール、パスワード	|高|
|19	|店舗オーナー管理ページ|	[オーナー] 自分の店舗の商品等管理	|高|
|20|商品登録|	[オーナー] 店舗の商品を登録 	|高|
|21|緯度経度検索機能|	[user] ｜ 住所から周辺のお店を検索できる 	|高|
|22|	全体管理ページ|	[全体管理者] 店舗情報の削除等編集できるようにするため	|低|
|23|	人気商品紹介|	よく購入されてる商品を紹介	|低|
|24|	ポイント機能（ポイント管理）|	[user] 購入金額に応じてポイント付与	|低|
|25	|地域情報紹介	|地域の催し・イベント、カルチャー教室情報を認知してもらうため。|低|
 
 
 
 
## テーブル定義
https://docs.google.com/spreadsheets/d/1ksjR8jALVoDQvgkHGg7ezRKrk37cmRDlron3tUVJ9RQ/edit?usp=sharing

## ER図
https://docs.google.com/spreadsheets/d/1EOhlkSKQrzxTB12Nvu3rOVGR8sedDboidbSlczKePEw/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1gaDbEnoRRVu-kATbk0w6C1HUoVk7YX1hvNH2a7GcKT4/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/19JrBziQ9RmG_a48GmnSglHNQ7V8L1j_MggaO5qxm7Sw/edit?usp=sharing

## 使用予定Gem
- carrierwave
- mini_magick
- devise
- ransack
- geocorder
- payjp
- twilio-ruby




