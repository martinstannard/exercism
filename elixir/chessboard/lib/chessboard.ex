defmodule Chessboard do
  @spec rank_range() :: list()
  def rank_range do
    1..8
  end

  @spec file_range() :: list()
  def file_range do
    ?A..?H
  end

  def ranks do
    rank_range() |> Enum.to_list
  end

  def files do
    file_range() |> Enum.map(fn(f) -> <<f>> end)
  end
end
