defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(digits, input_base, output_base) do
  end


  def to_binary(digits, 2), do: digits
  def to_binary(digits, input_base) do
    digits
    |> Enum.reverse
    |> Enum.reduce(0, fn)

  end

  def from_binary(digits, 2), do: digits
  def from_binary(digits, input_base) do

  end

  def to_decimal(digits, base) do
    digits
    |> Enum.reverse
    |> Enum.map_reduce(fn())
  end
  def sum_to_decimal(digits)
end
