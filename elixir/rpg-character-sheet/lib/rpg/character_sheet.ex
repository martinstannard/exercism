defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    data = IO.gets("What is your character's name?\n")

    data
    |> String.trim()
  end

  def ask_class() do
    data = IO.gets("What is your character's class?\n")

    data
    |> String.trim()
  end

  def ask_level() do
    data = IO.gets("What is your character's level?\n")

    data
    |> String.trim()
    |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    %{class: class, level: level, name: name}
    |> IO.inspect(label: "Your character")
  end
end
