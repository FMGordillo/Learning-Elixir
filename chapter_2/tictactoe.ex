defmodule MeterConverter do
  def convert(:feet, m) when is_number(m) and m >= 0, do: m * 3.28084
  def convert(:inch, m) when is_number(m) and m >= 0, do: m * 39.3701
  def convert(:yard, m) when is_number(m) and m >= 0, do: m * 1.09361
end

defmodule GetFile do
  def get(path) when is_bitstring(path) do
    case(File.read(path)) do
      {:ok, binary} -> IO.puts("TODO OK")
      {:error, reason} -> IO.puts("ERROR: #{reason}")
    end
  end
end

defmodule TicTacToe do
  def check_board(board) do
    case board do
      {:x, :x, :x, _, _, _, _, _, _} -> :x_win
      {_, _, _, :x, :x, :x, _, _, _} -> :x_win
      {_, _, _, _, _, _, :x, :x, :x} -> :x_win
      {:x, :x, :x, _, _, _, _, _, _} -> :x_win
      {:x, :x, :x, _, _, _, _, _, _} -> :x_win
      {:x, :x, :x, _, _, _, _, _, _} -> :x_win
      {:x, :x, :x, _, _, _, _, _, _} -> :x_win
    end
  end
end
