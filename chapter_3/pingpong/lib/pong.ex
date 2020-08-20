defmodule Pong do
  def start do
    await()
  end

  def await do
    receive do
      {:ping, sender} ->
        IO.puts("PONG!")
        send(sender, {:pong, self()})
    end

    await()
  end
end
