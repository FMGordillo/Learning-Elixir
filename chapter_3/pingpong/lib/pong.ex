defmodule Pong do
  def start do
    await(0)
  end

  def await(counter) do
    receive do
      {:ping, sender} ->
        IO.puts("Counter is on #{counter}")
        send(sender, {:pong, self()})
    end

    await(counter + 1)
  end
end
