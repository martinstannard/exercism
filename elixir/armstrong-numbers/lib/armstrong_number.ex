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
      |> sum_digits(number_length(number))

    sum == number
  end

  @spec sum_digits([integer], integer) :: integer
  defp sum_digits(digits, power) do
    digits
    |> Enum.reduce(0, fn digit, accum ->
      accum + Integer.pow(digit, power)
    end)
  end

  defp number_length(number) do
    number
    |> Integer.to_string()
    |> String.length()
  end

  @spec digits(integer) :: [integer]
  defp digits(number) do
    number
    |> Integer.to_string()
    |> String.split("")
    |> Enum.reject(fn s  -> s == "" end)
    |> Enum.map(&(String.to_integer/1))
  end
end
