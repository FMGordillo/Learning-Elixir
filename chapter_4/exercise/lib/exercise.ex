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

  def exists(key) do
    GenServer.call(@name, {:exists, key})
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
    [key, values] = data
    result = upsert_stats(stats, key, values)
    {:reply, data, result}
  end

  def handle_call({:read, key}, _from, stats) do
    query_result = Map.get(stats, key)
    {:reply, query_result, stats}
  end

  def handle_call({:delete, key}, _from, stats) do
    new_stats = Map.delete(stats, key)
    {:reply, new_stats, new_stats}
  end

  def handle_call({:exists, key}, _from, stats) do
    result = Map.has_key?(stats, key)
    {:reply, result, stats}
  end

  def handle_cast(:clear, _stats) do
    {:noreply, %{}}
  end

  defp upsert_stats(old_stats, key, value) do
    case Map.has_key?(old_stats, key) do
      true ->
        Map.update!(old_stats, key, value)

      false ->
        Map.put_new(old_stats, key, value)
    end
  end

end
