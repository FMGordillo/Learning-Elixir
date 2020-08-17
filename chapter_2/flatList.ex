defmodule FlatList do
  def flattern([]), do: []

  def flattern([head | tail]) do
    flattern(head) ++ flattern(tail)
  end

  def flattern(head), do: [head]
end
