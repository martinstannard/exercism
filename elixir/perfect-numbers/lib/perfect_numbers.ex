defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1, do: {:error, "Classification is only possible for natural numbers."}
  def classify(1), do: {:ok, :deficient}
  def classify(number) do
    number
    |> factors
    |> Enum.sum()
    |> do_classify(number)
  end

  defp factors(number) do
    1..div(number, 2)
    |> Enum.map(fn n -> factor(n, rem(number, n)) end)
  end

  @spec factor(number :: integer, integer) :: integer | nil
  defp factor(number, 0), do: number
  defp factor(_, _), do: 0

  defp do_classify(sum, number) do
    cond do
      sum == number -> {:ok, :perfect}
      sum > number -> {:ok, :abundant}
      sum < number -> {:ok, :deficient}
    end
  end
end
