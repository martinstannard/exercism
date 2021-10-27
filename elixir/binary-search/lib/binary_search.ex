defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    numbers
    |> Tuple.to_list()
    |> do_search(key, 0)
  end

  def do_search([], _, _) do
    :not_found
  end

  def do_search([key | rest], key, index) do
    {:ok, index}
  end

  def do_search([_ | t], key, index) do
    do_search(t, key, index + 1)
  end
end
