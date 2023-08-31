<div align="center">
  <h1><a href="https://www.credo-quest.com/" target="_blank">CREDO QUEST</a></h1>
  <h2>RUNTEQ CREDO（行動指針）を推進するTodoListアプリ</h2>
  <img src="https://github.com/furukawaeiichi/CREDO_QUEST/blob/main/app/assets/images/ogp.jpg?raw=true" alt="CREDO QUEST image"/>
</div>


## サービス概要
プログラミングスクールRUNTEQの掲げるCREDO（行動指針）を実践しやすいよう、
- デフォルトのTodoListにチェックできる
- オリジナルのTodoをCRUD/チェック/絞り込みできる

https://github.com/furukawaeiichi/CREDO_QUEST/assets/102509805/a929fc6b-32bd-48b9-9b62-3daff2fb2cb3

https://github.com/furukawaeiichi/CREDO_QUEST/assets/102509805/0cdb3e1f-aac4-493e-92f5-abe9b2bcff7d

## メインのターゲットユーザー
- RUNTEQ受講生
- 未経験からプログラミング学習/転職に取り組んでいる人

## ユーザーが抱える課題
- エンジニアに必要なカルチャー教育として「RUNTEQ　CREDO」が掲げられるも、カリキュラムに取り組む中で忘れてしまいがち
- リモート学習ゆえ、周りの人や模範生がどんなこと意識しているのか、分からず参考にしづらい

## 解決方法
- CREDOの項目ごとに、公募したベストプラクティスをTodoList化する
- Level表記して、簡単な内容から実践しやすくする
- デフォルトのTodoList項目に当てはまらないものは、自身でオリジナルのTodoとしてCRUD/絞り込みできる

## なぜこのサービスを作りたいのか？
- RUNTEQはCREDOを掲げる数少ないプログラミングスクールだが、学習をしながらどう意識していいのかわかりづらかった
- 他の受講生を見ていてもCREDOに関する情報発信が少ないように感じた
- リモート学習ゆえ、他の受講生がどんな意識・工夫をしているのか、分からず参考にしづらかった
- CREDOのベストプラクティスを公募して、「ひとつの指標」と「情報が蓄積されるプラットフォーム」を作りたかった

## 主な機能
  **1.ログイン機能（X API）**
  - Xアカウントでログインを簡略化できる
  - ユーザー名、アバター情報を取得して、パスワードの登録工程も省略できる

  **2.非同期通信機能（Hotwire）**
  - BGMを途切れず流れたまま、TODOのCRUDやページ遷移ができる

  **3.Level/プログレスバー機能（Bootstrap）**
  - Todoのチェック合計数がLevelとして表示される
  - 各項目ごとにチェックの進捗が見える化できる

  **4.フォロー機能**
  - マイページから、フォローユーザーのマイページへ遷移できる

  **5.いいね機能**
  - 他ユーザーのオリジナルTodoにいいねできる

## 使用技術
  **バックエンド**
  - Ruby （3.2.2）
  - Rails （7.0.6）
  
  **フロントエンド**
  - JavaScript
  - Hotwire
  - Bootstrap  (5.2.3)
  
  **インフラ**
  - Heroku

## ER図
<img width="1827" alt="スクリーンショット 2023-09-01 2 49 39" src="https://github.com/furukawaeiichi/CREDO_QUEST/assets/102509805/55d15fe4-2052-459a-b335-b803eb5445b0">
