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

  @spec sum_digits([integer]) :: integer
  defp sum_digits(digits) do
    power = length(digits)
    digits
    |> Enum.reduce(0, fn digit, accum ->
      accum + Integer.pow(digit, power)
    end)
  end

  @spec digits(integer) :: [integer]
  defp digits(number) do
    number
    |> Integer.to_string()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
