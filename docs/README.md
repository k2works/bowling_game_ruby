  
  
ボウリングゲーム
---
  
## 基本仕様
  
+ 1投目で10ピンすべて倒したら、ストライク
+ スペアは、2投目で10ピンすべて倒したということ
+ 1投目が0点で2投目で10ピン倒してもスペア
+ ガターは、1投目に横のガターに落ちて1ピンも倒せないこと
+ ボウリングでの最高得点は300点で、パーフェクトと言う
  
## ユースケース
  

![](assets/300bdaf8e14310a5b12ecf1422e44f030.png?0.7181293530052326)  
  
### ユースケース１：ストライク
  
```ruby
require 'test/unit'
class Game
  def initialize
    @score = 0
  end
  def score
    @score
  end
  def add(pin)
    @score =+ pin
  end
end
class TestGame < Test::Unit::TestCase
  def test_score
    g = Game.new
    g.add(10)
    assert_equal 10, g.score    
  end
end
```
<pre class="language-text">Loaded suite /Users/k2works/Projects/k2works/bowling_game_ruby/docs/srw7zrh7m_code_chunk
Started
.

Finished in 0.000394 seconds.
------
1 tests, 1 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
------
2538.07 tests/s, 2538.07 assertions/s
</pre>
  
### ユースケース２：スペア
  
  
### ユースケース３：ガター
  
  
### ユースケース４：パーフェクト
  
  
### ユースケース５：サンプルゲーム
  
![](./images/score.png )
  
## コアモデル
  

![](assets/300bdaf8e14310a5b12ecf1422e44f031.png?0.4593025962436903)  
  
## 参照
  
+ [ボウリング](https://ja.wikipedia.org/wiki/%E3%83%9C%E3%82%A6%E3%83%AA%E3%83%B3%E3%82%B0 )
  