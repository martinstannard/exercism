defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list, non_neg_integer) :: non_neg_integer
  def count(l, count \\ 0) do
    do_count(l, count)
  end

  def do_count([], count), do: count
  def do_count([h | t], count) do
    do_count(t, count + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end

  def do_reverse([], acc), do: acc
  def do_reverse([h | t], acc) do
    do_reverse(t, [h | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map(l, f, [])
  end

  def do_map([], _, acc), do: reverse(acc)
  def do_map([h | t], f, acc) do
    do_map(t, f, [f.(h) | acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter(l, f, [])
  end

  def do_filter([], _, acc), do: reverse(acc)

  def do_filter([h| t], f, acc) do
    case f.(h) do
      false -> do_filter(t, f, acc)
      nil -> do_filter(t, f, acc)
      _ -> do_filter(t, f, [h | acc])
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f) do
    do_foldl(l, acc, f)
  end

  def do_foldl([], acc, _), do: acc
  def do_foldl([h | t], acc, f) do
    foldl(t, f.(h, acc), f)
  end

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f) do
    foldl(reverse(l), acc, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    do_append(reverse(a), b)
  end

  def do_append(a, []), do: reverse(a)
  def do_append(a, [h|t]) do
    do_append([h|a], t)
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h|t]), do: append(h, concat(t))
end
