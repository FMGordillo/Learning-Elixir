defmodule Exercises do
  def exercise_01(list), do: Enum.sum(list)

  def exercise_05(message_to_show, n) do
    unless n == 0 do
      IO.puts(message_to_show)
      exercise_05(message_to_show, n - 1)
    end

    # How should this be improved?
    {:ok}
  end
end
