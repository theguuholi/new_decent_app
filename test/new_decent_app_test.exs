defmodule NewDecentAppTest do
  use ExUnit.Case

  alias NewDecentApp.Data.Balance

  describe "Awesome tests" do
    test "success" do
      balance = %Balance{coins: 10}

      {new_balance, result} =
        NewDecentApp.call(balance, [3, "DUP", "COINS", 5, "+", "NOTHING", "POP", 7, "-", 9])

      assert new_balance.coins == 5
      assert length(result) > 1
    end

    test "failed" do
      assert NewDecentApp.call(%Balance{coins: 10}, [
               3,
               "DUP",
               "FALSE",
               5,
               "+",
               "NOTHING",
               "POP",
               7,
               "-",
               9
             ]) == -1

      assert NewDecentApp.call(%Balance{coins: 1}, [3, 5, 6]) == -1
      assert NewDecentApp.call(%Balance{coins: 10}, ["+"]) == -1
      assert NewDecentApp.call(%Balance{coins: 10}, ["-"]) == -1
      assert NewDecentApp.call(%Balance{coins: 10}, ["DUP"]) == -1
      assert NewDecentApp.call(%Balance{coins: 10}, ["POP"]) == -1
    end
  end
end
