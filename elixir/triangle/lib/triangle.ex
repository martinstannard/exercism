defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    [a, b, c] = [a, b, c] |> Enum.sort
    cond do
      a <= 0 -> {:error, "all side lengths must be positive"}
      a + b < c -> {:error, "side lengths violate triangle inequality"}
      true -> tri_type(a, b, c)
    end
  end

  defp tri_type(x, x, x), do: {:ok, :equilateral}
  defp tri_type(x, x, _), do: {:ok, :isosceles}
  defp tri_type(_, x, x), do: {:ok, :isosceles}
  defp tri_type(_, _, _), do: {:ok, :scalene}
end
