defmodule Palindromes do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    create_all_combos(min_factor, max_factor)
    |> all_palindromes
    |> extract_limits
  end

  def create_all_combos(min, max) do
    for a <- min..max, b <- min..max, do: {a, b}
  end

  def all_palindromes(combos) do
    combos
    |> Enum.reduce([], fn {a, b}, acc ->
      (a * b)
      |> is_palindromic?
      |> add_to_results(acc, a, b)
    end)
  end

  def extract_limits(combos) do
    sorted = combos |> Enum.sort()

    [[low | _] | _] = sorted
    [[high | _] | _] = Enum.reverse(sorted)

    %{}
    |> Map.put(low, extract_factors(low, combos))
    |> Map.put(high, extract_factors(high, combos))
  end

  def extract_factors(sum, sums) do
    sums
    |> Enum.reduce([], fn [s | factors], acc ->
      collate(acc, sum, s, Enum.sort(factors))
    end)
    |> Enum.uniq()
  end

  def collate(acc, sum, sum, factors) do
    acc ++ [factors]
  end

  def collate(acc, _, _, _), do: acc

  def is_palindromic?(sum) do
    Integer.to_string(sum) == String.reverse(Integer.to_string(sum))
  end

  def add_to_results(true, results, a, b) do
    results ++ [[a * b, a, b]]
  end

  def add_to_results(_, results, _, _), do: results
end
