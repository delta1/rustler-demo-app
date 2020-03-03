defmodule MyNifTest do
  use ExUnit.Case
  require MyNif

  test "adds with our NIF" do
    assert MyNif.add(2, 3) == 5
  end

  test "generates integers using NIF" do
    ints = MyNif.generate(10, 100)
    assert length(ints) == 10
    assert Enum.min(ints) >= 1
    assert Enum.max(ints) <= 100
  end

  test "sorts array using NIF" do
    ints = [3, 1, 2]
    assert MyNif.sort(ints) == [1, 2, 3]
  end
end
