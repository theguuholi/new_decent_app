defmodule NewDecentApp do
  alias Balance.Core

  def call(balance, commands) do
    Core.create_balance(balance, commands)
  end
end
