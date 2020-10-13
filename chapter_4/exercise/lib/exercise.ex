defmodule Exercise do
  use GenServer

  @name CACHE

  ########
  # Client
  ########

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CACHE])
  end

  def write(key, values) do
    GenServer.call(@name, {:write, [key, values]})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.call(@name, {:delete, key})
  end

  def exist(key) do
    GenServer.call(@name, {:exist, key})
  end

  def clear() do
    GenServer.cast(@name, :clear)
  end


  ########
  # Server
  ########

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, data}, _from, stats) do
    IO.puts("DOU, inserted")
    {:reply, stats, stats}
  end

  def handle_call({:read, data}, _from, stats) do
    IO.puts("DOU, reading")
    {:reply, stats, stats}
  end

  def handle_call({:delete, key}, _from, stats) do
    IO.puts("DOU, deleted")
    {:reply, stats, stats}
  end

  def handle_call({:exists, key}, _from, stats) do
    IO.puts("DOU, HABER")
    {:reply, stats, stats}
  end

  def handle_cast(:clear, stats) do
    IO.puts("DOU, a limpiar we")
    {:reply, stats}
  end
end
