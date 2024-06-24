defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(""), do: false
  def valid?(number) do
    sum =
      number
      |> digits
      |> sum_digits

    sum == number
  end

  @spec sum_digits([String.s()]) :: integer
  defp sum_digits(digits) do
    digits
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&Integer.pow(&1, length(digits)))
    |> Enum.sum
  end

  @spec digits(integer) :: [String.s()]
  defp digits(number) do
    number
    |> Integer.to_string()
    |> String.split("", trim: true)
  end
end
