defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    # split
    string
    |> String.split([" ", "-"])
    |> Enum.map(fn(w) -> String.upcase(String.at(w,0)) end)
    |> Enum.join("")
  end
end