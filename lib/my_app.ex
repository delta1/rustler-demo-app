defmodule MyApp do
  @moduledoc """
  Documentation for `MyApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyApp.hello()
      :world

  """
  def hello do
    :world
  end

  def generate(num, upper) do
    1..num
    |> Enum.map(fn _ -> :rand.uniform(upper) end)
  end
end
