defmodule Recursive do
  def sum(_n), do: sum_accumulator(_n, 0)
  # We can use defp to declare private variable
  defp sum_accumulator(0, acc), do: acc
  defp sum_accumulator(n, acc) when n > 0 do
    sum_accumulator(n - 1, acc + n)
  end
end

IO.puts(Recursive.sum(5))

1 = Recursive.sum(1)
6 = Recursive.sum(3)
10 = Recursive.sum(4)
