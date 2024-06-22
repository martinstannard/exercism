defmodule Bowling do
  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @current_score 0

  @spec start() :: any
  def start do
    %{
      current_score: 0,
      extra_score: 0,
      frame: 1,
      pins_left: 10,
      roll: 1,
    }
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful error tuple.
  """

  @spec roll(any, integer) :: {:ok, any} | {:error, String.t()}
  def roll(game, roll) do
    {:ok, handle_roll(game, roll)}
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful error tuple.
  """

  @spec score(any) :: {:ok, integer} | {:error, String.t()}
  def score(game) do
    {:ok, game[:current_score]}
  end

  # strike
  defp handle_roll(%{roll: 1} = game, 10) do
    IO.inspect 10
    IO.inspect game
    %{game |
      current_score: roll_score(game, 10),
      extra_score: game.extra_score + 2,
      frame: game.frame + 1,
      pins_left: 10,
      roll: 1
    }
  end

  # spare frame 10
  defp handle_roll(%{frame: 10, roll: 2, pins_left: pins} = game, pins) do
    %{game |
      current_score: roll_score(game, pins),
      extra_score: 0,
      frame: game.frame + 1,
      pins_left: 10,
      roll: 1
    }
  end

  # spare
  defp handle_roll(%{roll: 2, pins_left: pins} = game, pins) do
    IO.inspect pins
    IO.inspect game
    %{game |
      current_score: roll_score(game, pins),
      extra_score: 1,
      frame: game.frame + 1,
      pins_left: 10,
      roll: 1
    }
  end

  # plain hit
  defp handle_roll(%{roll: 1} = game, pins) do
    IO.inspect pins
    IO.inspect game
    %{game |
      current_score: roll_score(game, pins),
      extra_score: extra_score(game),
      pins_left: 10 - pins,
      roll: 2
    }
  end

  #
  defp handle_roll(%{roll: 2} = game, pins) do
    IO.inspect pins
    IO.inspect game
    %{game |
      current_score: roll_score(game, pins),
      extra_score: extra_score(game),
      frame: game.frame + 1,
      pins_left: 10,
      roll: 1
    }
  end

  # defp roll_score(%{frame: 11} = game, roll) do
  #   game.current_score + roll * 2
  # end

  defp roll_score(%{extra_score: extra} = game, roll) when extra > 0 do
    game.current_score + roll * extra
  end

  defp roll_score(game, roll) do
     game.current_score + roll
  end

  defp extra_score(%{extra_score: extra}) when extra > 0, do: extra - 1
  defp extra_score(_), do: 0
end
