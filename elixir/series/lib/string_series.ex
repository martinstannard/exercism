defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    digits = s |> to_list
    extract(digits, 0, size)
  end

  defp to_list(string) do
    string
    |> String.split("")
    |> Enum.reject(fn s -> s == "" end)
  end

  defp extract(digits, start, length) do
    digits
    |> Enum.slice([start..length])
  end
end
