defmodule NameBadge do
  def print(id, name, department) do
    "#{id(id)}#{name} - #{depart(department)}"
  end

  defp depart(dept) do
    if dept == nil do
      "OWNER"
    else
      String.upcase(dept)
    end
  end

  defp id(id) do
    if id == nil do
      ""
    else
      "[#{id}] - "
    end
  end
end
