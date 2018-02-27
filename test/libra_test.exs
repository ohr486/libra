defmodule LibraTest do
  use ExUnit.Case
  doctest Libra

  test "greets the world" do
    assert Libra.hello() == :world
  end
end
