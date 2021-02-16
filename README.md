# README

# 個人事業主と企業のためのソーシャルワークツール(仮)

## 概要
企業や個人事業主等が異なる分野や技術を持つ他の企業・個人事業主と出会い、<br>
コラボレーションすることで、新しいプロジェクトやビジネスチャンスを創造する機会を提供する。

## コンセプト
不特定多数が対象ではなく、安心して利用可能できるサービス

## バージョン
Ruby 2.6.5 <br>
Rails 5.2.4

## 機能一覧
- [ ] ログイン、ログアウト機能
- [ ] ユーザー登録機能
- [ ] ユーザー編集・削除機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] 新規提案・プロジェクト等一覧表示機能
- [ ] 新規提案・プロジェクト等一覧ページネーション機能
- [ ] 新規提案・プロジェクト等投稿機能
  - [ ] タイトルと詳細は必須
- [ ] 新規提案・プロジェクト等編集・削除機能
  - [ ] 管理者のみ実行可能
- [ ] 新規提案・プロジェクト等カテゴリ別検索機能
- [ ] 新規提案・プロジェクト等タグ検索機能
- [ ] コメント投稿・一覧表示機能
- [ ] コメント編集・削除機能
  - [ ] ~~コメント編集・削除はコメントした本人のみ可能~~
  - [ ] コメント編集は投稿者、削除は管理者のみ可能
- [ ] プロフィール掲載機能
 - [ ] 企業名・詳細は必須
 - [ ] ユーザーに紐づいた各企業、個人事業主のプロフィールを登録できる
 - [ ] プロフィール画像を登録できる
- [ ] プロフィール編集機能
 - [ ] ユーザーに紐づいた各企業、個人事業主のプロフィールを編集できる
- [ ] メッセージ(チャット)機能
- [ ] メッセージ(チャット)編集機能
- [ ] お問い合わせ機能
- [ ] SNSログイン機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1QarMazm0V8BS-qANOKpb1HXgNEDyPufsvOfpb9NfRE4/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1q_pe_E9GvUeGWUrViyDejw9MnJwPwINRYutINFH5Lg0/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1lzj2cUPg4r8MVvH0KEybdCnciPl06OOMxmE3O4-UG28/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1BZcZW4gN4798b8y_P3gPs5HXNigK1WUd7ORRgfcsYkk/edit?usp=sharing

## 使用予定Gem
* devise
* carrierwave
* mini_magick
* kaminari
* aws-sdk-s3
* fog-aws
* jquery-rails
* turbolinks
