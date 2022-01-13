defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.chunk_every(workers)
    |> Enum.reduce(%{}, fn(chunk, acc) ->
      chunk
      |> count_texts
      |> merge_result(acc)
    end)
  end

  defp count_texts(texts) do
    texts
    |> Enum.map(fn(text) ->
      Task.async(fn ->
        count_letters(text)
      end)
    end)
    |> Task.yield_many
    |> Enum.map(fn({_at, {:ok, res}}) ->
      res
    end)
  end

  defp count_letters(text) do
    text
    |> String.downcase
    |> String.split("")
    |> Enum.reject(fn(e) -> e in invalid_chars() end)
    |> Enum.reduce(%{}, fn(c, acc) ->
      Map.update(acc, c, 1, fn(count) ->
        count + 1
      end)
    end)
  end

  defp merge_result(latest, current) do
    latest
    |> Enum.reduce(current, fn(l, acc) ->
      Map.merge(l, acc, fn(_k, v1, v2) ->
        v1 + v2
      end)
    end)
  end

  defp invalid_chars do
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", " ", ".", ""]
  end
end
