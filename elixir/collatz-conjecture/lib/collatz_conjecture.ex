defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    collatz(input, 0)
  end

  @spec collatz(integer, integer) :: integer
  defp collatz(1, step), do: step

  defp collatz(number, step) do
    case even?(number) do
      true -> collatz(div(number, 2), step + 1)
      false -> collatz(3 * number + 1, step + 1)
    end
  end

  @spec even?(integer) :: boolean
  defp even?(number) do
    rem(number, 2) == 0
  end
end
