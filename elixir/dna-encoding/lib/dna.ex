defmodule DNA do
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000
  def encode_nucleotide(?\s), do: 0b0000

  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T
  def decode_nucleotide(0b0000), do: ?\s

  def encode(dna) do
    do_encode(<<0b0000>>, dna)
  end

  defp do_encode(result, []), do: result
  defp do_encode(result, [head | rest]) do
    IO.inspect result
    do_encode(result ++ <<encode_nucleotide(head)::4>>, rest)
  end

  def decode(dna) do
    do_decode('', dna)
  end

  defp do_decode(result, ""), do: to_charlist(result)
  defp do_decode(result, <<value::4, rest::bitstring>>) do
    do_decode(result ++ [decode_nucleotide(value)], rest)
  end
end
