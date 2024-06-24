defmodule VariableLengthQuantity do
  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) do
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) do
  end

  defp do_decode(integers) do
    accum = []
    integers
    |> Enum.map(fn (integer) ->
      decode_number(integer)
    end)
  end

  defp decode_number(integer, bitstring) do
    << first::7, _rest::bitstring >> = integer
  end

  defp do_decode_number(first, << 0::0 >>, accum) do

  end
end
