defmodule DateParser do
  def day() do
    "[[:digit:][:digit:]]"
  end

  def month() do
    "[[:digit:][:digit:]]"
  end

  def year() do
    "\\d{4}"
  end

  def day_names() do
    "[[:alpha:]]"
  end

  def month_names() do
    "[[:alpha:]]"
  end

  def capture_day() do
    "(?<day>\\d\\d)"
  end

  def capture_month() do
    "(?<month>\\d\\d)"
  end

  def capture_year() do
    "(?<year>\\d\\d\\d\\d)"
  end

  def capture_day_name() do
    "(?<day_name>[[:alpha:]]+)"
  end

  def capture_month_name() do
    "(?<month_name>[[:alpha:]]+)"
  end

  def capture_numeric_date() do
    "(?<day>\\d{2})/(?<month>\\d{2})/(?<year>\\d{4})"
  end

  def capture_month_name_date() do
    "(?<month_name>[[:alpha:]]+) (?<day>\\d{1,2}), (?<year>\\d{4})"
  end

  def capture_day_month_name_date() do
    "(?<day_name>[[:alpha:]]+), (?<month_name>[[:alpha:]]+) (?<day>\\d{1,2}), (?<year>\\d{4})"
  end

  def match_numeric_date() do
    ~r/^(?<day>\d\d)\/(?<month>\d\d)\/(?<year>\d\d\d\d)$/
  end

  def match_month_name_date() do
    ~r/^(?<month_name>[[:alpha:]]+) (?<day>\d{1,2}), (?<year>\d{4})$/
  end

  def match_day_month_name_date() do
    ~r/^(?<day_name>[[:alpha:]]+), (?<month_name>[[:alpha:]]+) (?<day>\d{1,2}), (?<year>\d{4})$/
  end
end
