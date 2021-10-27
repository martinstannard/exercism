defmodule Bowling do

  @current_score 0

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @spec start() :: any
  def start do
    %{
      current_score: 0,
      frame: 1,
      roll_number: 0,
      previous_roll: 0,
      was_spare: false,
      strike_count: 0,
      double_count: 0
    }
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t()
  def roll(game, roll) do
    handle_roll(game, roll)
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t()
  def score(game) do
    game[:current_score]
  end

  # strike
  defp handle_roll(%{roll_number: 0} = game, 10) do
    IO.puts "strike"
    IO.inspect game
    %{ game |
       previous_roll: 10,
       current_score: roll_score(game, 10),
       double_count: game.double_count + 2,
       roll_number: 0,
       previous_roll: 10,
       frame: game.frame + 1
    }
  end

  # 2nd ball
  defp handle_roll(%{roll_number: 1} = game, roll) do
    IO.puts "2nd ball"
    IO.inspect game
    IO.inspect roll
    was_spare = roll + game.previous_roll == 10
    spare = spare(game.previous_roll, roll)
    %{ game |
       previous_roll: roll,
       current_score: roll_score(game, roll),
       double_count: spare,
       roll_number: 0,
       frame: game.frame + 1
    }
  end

  # 1st ball
  defp handle_roll(%{roll_number: 0} = game, roll) do
    IO.puts "1st ball"
    IO.inspect game
    IO.inspect roll
    %{ game |
       previous_roll: roll,
       current_score: roll_score(game, roll),
       double_count: counter(game),
       roll_number: 1,
    }
  end

  defp roll_score(%{frame: 11} = game, roll) do
    game.current_score + roll * 2
  end

  defp roll_score(%{double_count: dc} = game, roll) when dc > 0 do
    game.current_score + roll * 2
  end

  defp roll_score(game, roll) do
    game.current_score + roll
  end

  defp counter(%{double_count: dc}) when dc > 0 do
    dc - 1
  end

  defp counter(_) do
    0
  end

  defp spare(previous, roll) when (previous + roll == 10), do: 1
  defp spare(_, _), do: 0
end
