defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """

  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(0), do: []

  def matrix(dimension) do
    acc = {
      {0, 0, :r},
      construct_matrix(dimension)
    }

    {_, result} =
      1..(dimension * dimension)
      |> Enum.reduce(acc, fn n, {pos, mat} ->
        m = place_number(n, pos, mat)
        p = next_position(pos, dimension, mat)
        {p, m}
      end)

    result
  end

  @spec construct_matrix(non_neg_integer()) :: list()
  def construct_matrix(dimension) do
    0 |> List.duplicate(dimension) |> List.duplicate(dimension)
  end

  def place_number(n, {x, y, _}, matrix) do
    {row, _} = matrix |> List.pop_at(y)
    matrix |> List.replace_at(y, List.replace_at(row, x, n))
  end

  def next_position({x, y, :r}, dimension, _) when x == dimension - 1 do
    {x, y + 1, :d}
  end

  def next_position({x, y, :r}, _, matrix) do
    if clear?(x + 1, y, matrix) do
      {x + 1, y, :r}
    else
      {x, y + 1, :d}
    end
  end

  def next_position({x, y, :d}, dimension, _) when y == dimension - 1 do
    {x - 1, y, :l}
  end

  def next_position({x, y, :d}, _, matrix) do
    if clear?(x, y + 1, matrix) do
      {x, y + 1, :d}
    else
      {x - 1, y, :l}
    end
  end

  def next_position({x, y, :l}, _, _) when x == 0 do
    {x, y - 1, :u}
  end

  def next_position({x, y, :l}, _, matrix) do
    if clear?(x - 1, y, matrix) do
      {x - 1, y, :l}
    else
      {x, y - 1, :u}
    end
  end

  def next_position({x, y, :u}, _, matrix) do
    if clear?(x, y - 1, matrix) do
      {x, y - 1, :u}
    else
      {x + 1, y, :r}
    end
  end

  def clear?(x, y, matrix) do
    element =
      matrix
      |> Enum.at(y)
      |> Enum.at(x)

    element == 0
  end
end
