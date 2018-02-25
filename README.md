# callout_alarm - Mac OS X 向け、時刻読み上げ目覚まし時計

## インストール

    $ git clone https://github.com/hgwr/callout_alarm.git
    
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
