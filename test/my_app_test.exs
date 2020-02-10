defmodule MyAppTest do
  use ExUnit.Case
  doctest MyApp

  test "greets the world" do
    assert MyApp.hello() == :world
  end

  test "generates integers" do
    ints = MyApp.generate(10, 100)
    assert length(ints) == 10
    assert Enum.min(ints) >= 1
    assert Enum.max(ints) <= 100
  end
end
