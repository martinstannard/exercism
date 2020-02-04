defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    Map.put(db, grade, name)

    {_, new} =
      Map.get_and_update(db, grade, fn current_value ->
        case current_value do
          nil -> {current_value, [name]}
          current_value -> {current_value, current_value ++ [name]}
        end
      end)

    new
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    db
    |> Map.get(grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    db
    |> Enum.map(fn {k, v} ->
      {k, Enum.sort(v)}
    end)
    |> Enum.sort()
  end
end
