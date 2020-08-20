defmodule Pingpong do
  def start do
    ping = spawn_link(Ping, :start, [])
    pong = spawn_link(Pong, :start, [])

    send(pong, {:ping, ping})
  end
end
