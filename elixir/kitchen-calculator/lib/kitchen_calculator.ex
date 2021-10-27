defmodule KitchenCalculator do
  def get_volume({_, amount}) do
    amount
  end

  def to_milliliter({:milliliter, amount}) do
    {:milliliter, amount}
  end

  def to_milliliter({:cup, amount}) do
    {:milliliter, amount * 240}
  end

  def to_milliliter({:fluid_ounce, amount}) do
    {:milliliter, amount * 30}
  end

  def to_milliliter({:teaspoon, amount}) do
    {:milliliter, amount * 5}
  end

  def to_milliliter({:tablespoon, amount}) do
    {:milliliter, amount * 15}
  end

  def from_milliliter({:milliliter, mls}, :milliliter) do
    {:milliliter, mls}
  end

  def from_milliliter({:milliliter, mls}, :cup) do
    {:cup, mls / 240}
  end

  def from_milliliter({:milliliter, mls}, :fluid_ounce) do
    {:fluid_ounce, mls / 30}
  end

  def from_milliliter({:milliliter, mls}, :teaspoon) do
    {:teaspoon, mls / 5}
  end

  def from_milliliter({:milliliter, mls}, :tablespoon) do
    {:tablespoon, mls / 15}
  end

  def convert(from, to) do
    mls =
      from
      |> to_milliliter
      |> get_volume
    from_milliliter({:milliliter, mls}, to)
  end
end
