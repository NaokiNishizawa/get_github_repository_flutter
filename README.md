# get_github_repository_flutter
## 実行する前にすること

1. assets/.env.exampleに自身のGitHubのアクセストークンを記載する
1. .env.example -> .env にリネームする

## アーキテクチャー

1. MVVMを採用

- 理由
    - 今回は小規模のプロジェクトだったため
    - 各クラスの責務を分けるため

## 全体構成
- view
    - UI部分

- viewModel
    - viewとrepositoryを繋ぐ

- repository
    - API通信を行うdataSourceとviewModelを繋ぐ

- dataSource
    - 責務としてAPI通信を行う


## 工夫点

1. envファイルを利用して機密情報を隠すことを実現
1. GitHubのレポジトリを一気に100件取得するのではなく、30件ずつ取得してユーザビリティをよくした
1. 検索結果のリストをタップすることで、そのURLを外部のWebブラウザを利用して開くという追加機能を実装した
1. reverpodを利用してDIをすることで、テスト可能なコードとした

## 申し送り事項

1. 本当は無限に検索結果を取得したかったが、100件以上を取得する方法がわからなかった(GitHub APIによる制限が一度にMAX 100件)

以上。
