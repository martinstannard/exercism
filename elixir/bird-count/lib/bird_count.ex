defmodule BirdCount do
  def today([today | _]) do
    today
  end

  def today([]), do: nil

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]) do
    [today + 1 | rest]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  def total(list), do: totalizer(0, list)
  defp totalizer(total, []), do: total
  defp totalizer(total, [day | tail]), do: totalizer(total + day, tail)

  def busy_days(list), do: busy(0, list)
  defp busy(total, []), do: total
  defp busy(total, [day | rest]) when day > 4 do
    busy(total + 1, rest)
  end
  defp busy(total, [day | rest]) do
    busy(total, rest)
  end
end
