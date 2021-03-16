# Meets Suggests & Abilities

## Index
- [Description](#description)<br>
- [Purpose](#purpose)<br>
- [Features](#features)<br>
- [Requirement](#requirement)<br>
- [Diagram](#diagram)<br>
- [Usage](#usage)<br>
- [URL](#url)<br>


## Description
企業のためのソーシャルワークツール

## Purpose
- 大・中小企業、個人事業主、フリーランスなどあらゆる事業形態の企業・個人が、<br>
互いの分野・スキルを生かした提案やプロジェクトを共有し自由に参加できる機会を提供する
<br>

- 複数企業がコラボレーションすることで新しいビジネスを創造する
- コロナ禍で苦境に立たされている業種を支援する
- 個人や小規模な企業が持つ技術を発信し広める機会を作る	

## Features

#### ユーザー登録（devise）

- プロフィール掲載機能 
  - プロフィール画像を登録できる（CarrierWave, aws s3）
- 登録内容の編集・削除機能
- ログイン、ログアウト機能

#### 新規提案・プロジェクト
- 一覧表示機能
  - ページネーション機能（kaminari）
  - カテゴリ別検索機能
  - タグ検索機能
- 投稿機能
- 詳細表示機能
- 編集・削除機能
  - 管理者のみ実行可能

#### コメント機能（Ajax, JQuery）

-  投稿・一覧表示機能
-  編集・削除機能
   - 投稿者は編集、管理者は削除が可能

#### 企業登録
- プロフィール掲載機能 
  - 企業、個人事業のプロフィールを登録できる
  - プロフィール画像を登録できる
- プロフィール編集機能

#### メッセージ(チャット)機能（ActionCable)
- 投稿機能
  - 提案・プロジェクトに参加中の企業担当者同士でやりとりができる
 
#### お問い合わせ機能
- 通知メール送信機能(ActionMailer)
  - 問い合わせをしたユーザーと管理者へ通知メールが届く


## Requirement
- Ruby   2.6.5 <br>
- Ruby on Rails   5.2.4<br>
- Postgresql<br>
- Puma
- AWS 
  - S3
#### Development
- Docker / Docker-compose
- CircleCI
- Capistrano 3
#### Production
- AWS 
  - VPC
  - EC2
  - SES
- Unicorn
- Nginx
#### Test
- RSpec
  - model
  - controller
  - requests
  - system
- FactoryBot
- Capybara / capybara-email
- seed-fu

## Diagram
#### ER図
https://github.com/Sec-il-n/sample_4_release/blob/main/ER%E5%9B%B3_suggest_2.png

#### テーブル定義
https://docs.google.com/spreadsheets/d/1q_pe_E9GvUeGWUrViyDejw9MnJwPwINRYutINFH5Lg0/edit?usp=sharing

#### カタログ設計
https://docs.google.com/spreadsheets/d/1IHxop4dQuERzb5PKbrBkjRABzd4cVO5q8ieg7SDzzx0/edit?usp=sharing

#### 画面遷移図
https://github.com/Sec-il-n/sample_4_release/blob/main/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3_suggests.png

#### インフラ構成図
![インフラ構成図](https://github.com/Sec-il-n/sample_4_release/blob/main/%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E6%A7%8B%E6%88%90%E5%9B%B3.png)


## Usage
ユーザー登録後ログインした上で以下の各リンクをクリックすると画面へ移動します<br>

#### 企業登録済みユーザーでログイン
- email: `user_1_corp@hoge1.jp`,  password: `password`で[ログイン](http://35.72.239.105/users/sign_in)<br>

#### 利用者

- [ユーザー登録](http://35.72.239.105/users/sign_up)をする
  - [ログイン](http://35.72.239.105/users/sign_in)する
  - 提案・プロジェクトの一覧・詳細を閲覧できる
  - 提案・プロジェクトの詳細画面でコメントを閲覧できる
  - サービスの管理者に対して[問い合わせ](http://35.72.239.105/contacts/new)が出来る
  - 登録されたユーザー、企業のプロフィールを閲覧できる
  - プロフィールの編集ができる
  
- [企業登録](http://35.72.239.105/corporations/select)をする
  - [新規提案](http://35.72.239.105/suggests/new)から**提案やプロジェクトの投稿**ができる
  - 提案・プロジェクトの内容変更等、サービスの管理者に対して[問い合わせ](http://35.72.239.105/contacts/new)が出来る
  - **他ユーザーの提案・プロジェクトに対し、詳細画面からコメント**することが出来る
  - 詳細画面から**自身の投稿したコメントを編集**することが出来る
  - 提案・プロジェクト詳細画面に表示される**参加ボタンから提案・プロジェクトへ参加**できる
  - **参加中の提案・プロジェクト投稿者とチャットルームを開設**できる
  - チャットルーム退出後再度入室するとメッセージ一覧が表示される
  - **参加中のプロジェクトを一覧表示**できる

#### 管理者
#### 登録済み管理者ユーザーでログイン
- email:`admin_10@hoge0.jp`, password: `password`で[ログイン](http://35.72.239.105/users/sign_in)
  - [管理者画面](http://35.72.239.105/admin/users)から提案・プロジェクトの編集・削除ができる


## Process
![作成過程](https://github.com/Sec-il-n/sample_4_release/blob/main/%E6%99%82%E7%B3%BB%E5%88%97.png)

#### サービス作成時意識した点
- **実務レベルにより近い技術**を組み込む<br>
- スクールで学習した技術で自身にとって初見ものを出来るだけ全て組み込む<br>
- **1から自分でイメージ、構成したサービス**である<br>
- **社会問題を解決でき得る、もしくは万人にとって利用価値のある**アプリケーション<br>
- **テストコード**<br>
 初期にアプリケーションを作成した時から**テストは極めて重要だという考え**があり、<br>
 実務レベル的に評価できるものではないかもしれないが、**自身が理解できうる範囲内で網羅率の高いテストを書く**よう心がけた。<br>
- **Credencial、Action Cable**<br>
今回使用した**rails5で導入された機能を積極的に取り入れた**<br>

#### 苦労した点
- **アソシエーション**<br>
  - 設計段階で理解不十分だった為実装開始後に修正が多発
- **I18N**<br>
  - どのファイルを使用するか、ymlファイル内の定義の場所<br>
- **RSpec**<br>
  - Systemの要素取得<br>
  - 画像アップロードのテスト（mockの使用）<br>
- **Ajaxのコメント編集機能**<br>
  - 要素の取得<br>
  - パーシャル、レンダリング<br>
  - コントローラとの連携とデータ保存<br>
- **docker環境の構築**<br>
  - DockerFileの記法 <br>
- **CircleCIのデプロイ**<br>
  - SSH秘密鍵の扱い<br>
- **本番環境やCircleCI上でのpostgresqlの構築**<br>

#### 解決できなかった問題、改善が必要な点
- 編集時の複数タグの付け替え<br>
  - 異なるタイプのrequestを同時にかつ複数処理するにはどのようにすれば良いか <br>
- フロントエンド
  - ユーザビリティとデザイン性が乏しい<br>

#### 今後取り入れたい技術
- SNSログイン <br>
- AWS <br>
  - route53　実装しかけたが、時間的都合で断念。作成注ポートフォリオに使用予定。 <br>
  - RDS <br>
- API <br>
  - 現在作成開始したポートフォリオにZoom、Google Mapを使用予定。 <br>

#### その他
今回は学習の為、devise以外はできるだけgemを使用せず実装したが、 今後は適宜積極的に使用していきたい。

## URL
[http://35.72.239.105/](http://35.72.239.105/)

## Author
[sec-il-n](https://github.com/Sec-il-n/resume_auther/blob/main/README.md)
