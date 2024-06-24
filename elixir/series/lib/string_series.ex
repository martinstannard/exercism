defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1, do: []

  def slices(s, size) do
    s
    |> to_list
    |> extract(size, [])
    |> Enum.reverse()
  end

  defp extract(digits, length, accum) do
    digits
    |> Enum.slice(0..(length - 1))
    |> do_extract(digits, length, accum)
  end

  defp do_extract(substring, _digits, length, accum) when length(substring) < length, do: accum
  defp do_extract(substring, [_h | rest], length, accum) do
    extract(rest, length, [Enum.join(substring, "") | accum])
  end

  defp to_list(string) do
    string
    |> String.split("")
    |> Enum.reject(fn s -> s == "" end)
  end
end
