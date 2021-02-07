defmodule NewDecentAppTest do
  use ExUnit.Case
  doctest NewDecentApp

  test "greets the world" do
    assert NewDecentApp.hello() == :world
  end
end
