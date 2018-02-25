# callout_alarm - Mac OS X 向け、時刻読み上げ目覚まし時計

## インストール

    $ git clone https://github.com/hgwr/callout_alarm.git
    
Mac OS X のシステム環境設定の「省エネルギー」の「スケジュール...」で、
起床時刻に「起動またはスリープ解除」が起きるようにします。

スピーカーのボリューム等もあらかじめ適切な音量になるように設定しておきます。
    
## 使用方法

    $ cd callout_alarm
    $ bin/callout_alarm "時刻の読み上げ間隔(秒)" "読み上げ開始時刻" "読み上げ終了時刻"

## 実行例

    $ cd callout_alarm
    $ bin/callout_alarm 120 07:00 08:01

## 終了方法

Ctrl-C で終了してください。

## テスト

    $ cd callout_alarm
    $ rake test
