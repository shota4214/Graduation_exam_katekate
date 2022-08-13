# README

## バージョン
* Ruby 3.0.1
* Ruby on Rails 6.0.3

## 就業Termの技術
* AWS EC2
* devise
* Ajaxを使ったコメント機能
* フォロー・フォロワー機能
* メール通知機能
* お気に入り機能

## カリキュラム外の技術
* PV数カウントgem(impressionist)
* ウィザード形式の入力フォームgem(wicked)
* CSSフレームワーク(Bulma)

## 準備
```
$ git clone git@github.com:shota4214/Graduation_exam_katekate.git
$ cd Graduation_exam_katekate
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## アプリケーション実行
```
$ rails s
```

## カタログ設計
[カタログ設計　スプレッドシート](https://docs.google.com/spreadsheets/d/1VZ91-x6q8wQ8oJU2w7w8Fg1JAt1p2uCHBd0Nv9BZqHQ/edit?usp=sharing)
## テーブル定義書
[テーブル定義書　スプレッドシート](https://docs.google.com/spreadsheets/d/1VZ91-x6q8wQ8oJU2w7w8Fg1JAt1p2uCHBd0Nv9BZqHQ/edit?usp=sharing)
## ワイヤーフレーム
![スクリーンショット 2022-08-04 18 48 12](https://user-images.githubusercontent.com/104758322/182818257-39466d8f-1aa9-43c1-8ed5-ca4ea92b439b.png)
## ER図
![katekate_app-Page-1 drawio](https://user-images.githubusercontent.com/104758322/184463700-36dd53ce-a132-4315-b926-4b2c33a9bf6c.png)

## 画面遷移図
<img width="907" alt="スクリーンショット 2022-08-04 18 48 41" src="https://user-images.githubusercontent.com/104758322/182818481-c084565c-083b-4bce-a4cb-d519b8c47081.png">