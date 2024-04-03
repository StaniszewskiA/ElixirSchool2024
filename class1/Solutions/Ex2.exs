defmodule FizzBuzz do
  def fizzbuzz(0), do: []
  def fizzbuzz(n) when is_integer(n) and n > 0 do
    Enum.map(1..n, &fz/1)
  end

  defp fz(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp fz(number) when rem(number, 3) == 0, do: :fizz
  defp fz(number) when rem(number, 5) == 0, do: :buzz
  defp fz(number), do: number
end

[] = FizzBuzz.fizzbuzz(0)
[1] = FizzBuzz.fizzbuzz(1)
[1, 2] = FizzBuzz.fizzbuzz(2)
[1, 2, :fizz] = FizzBuzz.fizzbuzz(3)

[
  1,
  2,
  :fizz,
  4,
  :buzz,
  :fizz,
  7,
  8,
  :fizz,
  :buzz,
  11,
  :fizz,
  13,
  14,
  :fizzbuzz,
  16,
  17,
  :fizz,
  19,
  :buzz,
  :fizz,
  22,
  23,
  :fizz,
  :buzz,
  26,
  :fizz,
  28,
  29,
  :fizzbuzz,
  31
] = FizzBuzz.fizzbuzz(31)
