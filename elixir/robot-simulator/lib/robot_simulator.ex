defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  defstruct direction: :north, position: {0, 0}

  @directions [:north, :east, :south, :west]

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create do
    %RobotSimulator{}
  end

  def create(direction, _) when direction not in @directions do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y} = position) when is_number(x) and is_number(y) do
    %RobotSimulator{direction: direction, position: position}
  end

  def create(_, _) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.split("", trim: true)
    |> Enum.reduce_while(robot, fn instruction, robot ->
      step(instruction, robot)
    end)
  end

  defp step(instruction, robot) when instruction in ["L", "R"] do
    {:cont, turn(robot, instruction)}
  end

  defp step("A", robot) do
    {:cont, advance(robot)}
  end

  defp step(_, _), do: {:halt, {:error, "invalid instruction"}}

  def turn(%RobotSimulator{} = robot, hand),
    do: %{robot | direction: do_turn(robot.direction, hand)}

  defp do_turn(:east, "R"), do: :south
  defp do_turn(:south, "R"), do: :west
  defp do_turn(:west, "R"), do: :north
  defp do_turn(:north, "L"), do: :west
  defp do_turn(:east, "L"), do: :north
  defp do_turn(:south, "L"), do: :east
  defp do_turn(:west, "L"), do: :south

  def advance(%RobotSimulator{} = robot),
    do: %{robot | position: do_advance(robot.direction, robot.position)}

  defp do_advance(:north, {x, y}), do: {x, y + 1}
  defp do_advance(:south, {x, y}), do: {x, y - 1}
  defp do_advance(:east, {x, y}), do: {x + 1, y}
  defp do_advance(:west, {x, y}), do: {x - 1, y}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: %RobotSimulator{}) :: atom
  def direction(%RobotSimulator{direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: %RobotSimulator{}) :: {integer, integer}
  def position(%RobotSimulator{position: position}), do: position
end
