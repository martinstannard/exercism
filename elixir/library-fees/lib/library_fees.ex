defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, ndt} = NaiveDateTime.from_iso8601(string)
    ndt
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(days_to_add(before_noon?(checkout_datetime)))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> do_days_late
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    due_date =
      checkout
      |> datetime_from_string
      |> return_date

    date_returned =
      return
      |> datetime_from_string

    days_late = days_late(due_date, date_returned)
    fee = rate * days_late

    date_returned
    |> monday?
    |> discount(fee)
  end

  def discount(false, fee), do: fee
  def discount(_, fee), do: Kernel.floor(fee / 2)

  defp days_to_add(true), do: 28
  defp days_to_add(false), do: 29

  defp do_days_late(diff) when diff < 0, do: 0
  defp do_days_late(diff), do: diff
end
