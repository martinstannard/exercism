defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | tail]) do
    tail
  end

  def first([head | _]) do
    head
  end

  def count(list) do
    do_count(list, 0)
  end

  defp do_count([], count), do: count

  defp do_count([_ | tail], count) do
    do_count(tail, count + 1)
  end

  def exciting_list?(list) do
    do_exciting?(list, false)
  end

  defp do_exciting?(["Elixir" | tail], _) do
    do_exciting?(tail, true)
  end

  defp do_exciting?([_ | tail], exciting) do
    do_exciting?(tail, exciting)
  end

  defp do_exciting?([], exciting) do
    exciting
  end
end
