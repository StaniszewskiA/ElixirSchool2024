defmodule Scrabble do
  @letter_values %{
    "AEIOULNRST" => 1,
    "DG"         => 2,
    "BCMP"       => 3,
    "FHVWY"      => 4,
    "K"          => 5,
    "JX"         => 8,
    "QZ"         => 10
  }

  def calculate_score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.map(&score_letter/1)
    |> Enum.sum()
  end

  defp score_letter(letter) do
    for {letters, score} <- @letter_values do
      if String.contains?(letters, letter) do
        score
      end
    end
    0
  end
end

13 = Scrabble.calculate_score("elixir")
2 = Scrabble.calculate_score("is")
6 = Scrabble.calculate_score("fun")
