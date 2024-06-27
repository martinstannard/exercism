defmodule FoodChain do
  @doc """
  Generate consecutive verses of the song 'I Know an Old Lady Who Swallowed a Fly'.
  """

  @animals ~w[fly spider bird cat dog goat cow horse]
  @how %{
    fly: "\n",
    spider: "\nIt wriggled and jiggled and tickled inside her.\n",
    bird: "\nHow absurd to swallow a bird!\n",
    cat: "\nImagine that, to swallow a cat!\n",
    dog: "\nWhat a hog, to swallow a dog!\n",
    goat: "\nJust opened her throat and swallowed a goat!\n",
    cow: "\nI don't know how she swallowed a cow!\n",
    horse: "\nShe's dead, of course!\n"

  }
  @reasons %{
    fly: "",
    spider: "She swallowed the spider to catch the fly.\n",
    bird: "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
    cat: "She swallowed the cat to catch the bird.\n",
    dog: "She swallowed the dog to catch the cat.\n",
    goat: "She swallowed the goat to catch the dog.\n",
    cow: "She swallowed the cow to catch the goat.\n",
    horse: ""
  }

  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    animals(start, stop)
    |> IO.inspect
    |> Enum.map(fn(animal) -> verse(animal, stop) end)
    |> Enum.join("\n")
  end

  defp animals(start, stop) do
    (start-1..stop-1)
    |> Enum.map(fn(i) -> Enum.at(@animals, i) end)
  end

  defp verse(animal, start) do
    IO.puts "verse #{animal}, #{start}"
    swallowed(animal) <>
    @how[String.to_atom(animal)] <>
    reasons(start) <>
    outcome(animal)
  end

  defp swallowed(animal) do
    "I know an old lady who swallowed a #{animal}."
  end

  defp reasons(start) when start == length(@animals), do: ""
  defp reasons(start) do
    start
    |> animals_swallowed()
    |> Enum.map(fn(animal) -> reason(animal) end)
    |> Enum.join("")
  end

  defp reason(animal) do
    @reasons[String.to_atom(animal)]
  end

  defp outcome("horse"), do: ""
  defp outcome(_), do: "I don't know why she swallowed the fly. Perhaps she'll die.\n"

  defp animals_swallowed(start) do
    @animals
    |> Enum.slice(0, start)
    |> Enum.reverse
  end
end
