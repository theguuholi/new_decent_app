defmodule Balance.Core do
  alias NewDecentApp.Data.Balance

  defp command("DUP", bal, res), do: {update_balance_coins(bal, -1), res ++ [List.last(res)]}
  defp command("POP", bal, res), do: {update_balance_coins(bal, -1), List.delete_at(res, length(res))}

  defp command("-", bal,res) do
    [first, second | rest] = Enum.reverse(res)
    {update_balance_coins(bal, -1), Enum.reverse(rest) ++ [first - second]}
  end

  defp command("+", bal, res) do
    [first, second | rest] = Enum.reverse(res)
    {update_balance_coins(bal, -2), Enum.reverse(rest) ++ [first + second]}
  end

  defp command("COINS", bal, res), do: {update_balance_coins(bal, 6), res}
  defp command("NOTHING", bal, res), do: {update_balance_coins(bal, -1), res}
  defp command(_, bal, res), do: {bal, res}

  defp update_balance_coins(bal, cost) do
    %{bal | coins: bal.coins + cost}
  end

  def create_balance(%Balance{} = balance, commands) do
    IO.inspect(balance)
    IO.inspect(commands)

    IO.inspect("hi!!")

    commands
    |> Enum.reduce({balance, []}, fn command, {bal, res} ->
      case is_integer(command) do
        true ->
          {bal, res ++ [command]}

        false ->
          command(command, bal, res)
      end
    end)
    |> IO.inspect()

    {%Balance{coins: 5}, [1, 2]}
  end
end
