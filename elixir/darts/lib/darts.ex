defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance(x, y)
    |> calculate_score
  end

  defp calculate_score(d) when d <= 1.0, do: 10
  defp calculate_score(d) when d <= 5.0, do: 5
  defp calculate_score(d) when d <= 10.0, do: 1
  defp calculate_score(_), do: 0

  defp distance(x, y) do
    :math.sqrt(x * x + y * y)
  end
end
