defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0

  def egg_count(number) do
    number
    |> do_digits(0)
  end

  defp do_digits(number, sum) do
    eggs = add_digit(rem(number, 2), sum)
    cond do
      div(number, 2) == 0 -> eggs
      true -> do_digits(div(number, 2), eggs)
    end
  end

  defp add_digit(1, eggs), do: eggs + 1
  defp add_digit(_, eggs), do: eggs
end
