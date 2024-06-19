defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1) do
    []
  end

  def factors_for(target) do
    factor(target, 2, [])
  end

  defp factor(1, _, acc) do
    Enum.sort(acc)
  end

  defp factor(target, divisor, acc) do
    case divisible(target, divisor) do
      true -> factor(div(target, divisor), divisor, [divisor | acc])
      _ -> factor(target, divisor + 1, acc)
    end
  end

  defp divisible(target, divisor) do
    rem(target, divisor) == 0
  end
end
