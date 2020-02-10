defmodule MyNifTest do
  use ExUnit.Case
  require MyNif

  test "adds with our NIF" do
    assert MyNif.add(2,3) == 5
  end

  test "generates integers using NIF" do
    ints = MyNif.generate(10, 100)
    assert length(ints) == 10
    assert Enum.min(ints) >= 1
    assert Enum.max(ints) <= 100
  end
end
