# raisetech11-serverspec
ec2に構築したRailsAppをServerspecでテストしました。
- ポート開放(80番, 22番)
- 日本時間設定
- Nginx起動確認
- Puma起動確認
- MySQL, Ruby, Rails, Bundlerのバージョン確認
- Nginx設定ファイルの有無確認
- puma.rbへのソケット設定確認
- database.ymlへのhostの追加確認
- master.keyの有無確認
- Rails Appへアクセスできるhostのホワイトリストがクリアされているか確認
