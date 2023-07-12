■ 画面遷移図
Figma: https://www.figma.com/file/maCWg0bm5i2J3vSWHNci3k/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=36%3A1926&t=fVIy2m7QLhA4ANcX-1

■ 画面遷移図
ER図: [![Image from Gyazo](https://i.gyazo.com/adc1ad1c95ce9ad09743757dcf2034e7.png)](https://gyazo.com/adc1ad1c95ce9ad09743757dcf2034e7)

■ サービス概要
プログラミング初学者に向けたプログラミング学習サービスで
Rubyを使ってアルゴリズムの学習を行うことができます。
自身で環境構築する必要なく、ブラウザ上でコードを書くことができます。

■ 他サービスとの差別化ポイント
このアプリはターゲットユーザーをプログラミング未経験からRuby 


■メインのターゲットユーザー
- プログラミング未経験でRubyを学習しようとしている人
- RUNTEQ受講生

■ユーザーが抱える課題
・バックエンドの技術の学習を進める中でメソッドやアルゴリズムについての理解を深めたい
・手軽に、多くのアルゴリズムの問題を練習したい

■課題に対する仮説
・課題解決のための有効なメソッドを知らない
・エンジニアとしての問題の分解の仕方がわからない
・コードの組み立て方がわからない

■解決方法
・回答で使用されているメソッドなどを詳しく解説することで、理解を深める
・問題解決のための課題の分解方法なども回答例で確認することができる
・間違えた問題のお気に入り登録機能などで、振り返りを容易にする

■実装予定の機能
- 全ユーザー
    - 難易度で分けたクイズ
        - 【基礎編】4択などでのメソッド穴埋めクイズ
        - 【応用編】実際にコードを書いて答えるクイズ
        - 【実践編】リファクタリング実践
            - 特にメソッドに関してリファレンスマニュアルから検索できるよう、確からしいリソースを提供する
            - ブラウザ上で動くエディタの実装
            - ヒント機能
- ログインユーザー
    - お気に入り機能
        - 間違えた問題などを登録し振り返りができる
    - 学習進捗管理機能
        - 学習カレンダー
        - 総問題クリア数
    - ランキング機能
        - 回答量などを持ってユーザー同士の競争を煽りモチベーションの向上を図る
    - 通知機能
        - LINE通知機能
            - 学習時間・曜日などをユーザーが設定し通知させることで、モチベーション・アクティブ率の向上を図る。

- 管理ユーザー
    - 問題の一覧、詳細、作成、編集、削除
    - ユーザーの一覧、詳細、作成、編集、削除

■なぜこのサービスを作りたいのか？
RUNTEQのカリキュラムを進める中でアルゴリズムに関連する課題が一番身に付いていないと感じた中で
このアプリを通じてアルゴリズムの問題への苦手意識を克服し、得意になってもらいたい。
アルゴリズムについて学習したいと思い調べても、文章問題でコードを書くことと違っていたり
解答例が無いことがあったりする中で、回答解説まで丁寧な初学者向け学習サービスを作りたかった。

■スケジュール
企画〜技術調査：6/10〆切
README〜ER図作成：6/30 〆切
メイン機能実装：7/1 - 8/3
β版をRUNTEQ内リリース（MVP）：8/4〆切
本番リリース：8月末

■技術選定
- Rails7
- postgresql
- JavaScript
- Bootstrap
- heroku
