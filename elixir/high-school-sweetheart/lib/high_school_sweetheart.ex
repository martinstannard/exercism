defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.slice(0, 1)
  end

  def initial(name) do
    "#{first_letter(name)}."
    |> String.capitalize
  end

  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(fn(n) -> initial(n) end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    n1 = initials(full_name1)
    n2 = initials(full_name2)
"     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     #{n1}  +  #{n2}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  end
end
