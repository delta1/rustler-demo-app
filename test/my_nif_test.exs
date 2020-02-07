defmodule MyNifTest do
  use ExUnit.Case
  require MyNif

  test "adds with our NIF" do
    assert MyNif.add(2,3) == 5
  end
end
