defmodule LogParser do
  @start_regex ~r/^\[(DEBUG|INFO|ERROR|WARNING)\]/
  @split_regex ~r/(<[~\*-=]*>)/
  @replace_regex ~r/end-of-line\d+/i
  @user_regex ~r/User\s+([[:graph:]]+)/iu

  @spec valid_line?(String.s()) :: boolean
  def valid_line?(line) do
    line =~ @start_regex
  end

  def split_line(line) do
    splitter([line],Regex.scan(@split_regex, line))
  end

  @spec remove_artifacts(String.s()) :: String.s()
  def remove_artifacts(line) do
    Regex.replace(@replace_regex, line, "")
  end

  def tag_with_user_name(line) do
    name = Regex.run(@user_regex, line)
    tag_line(name, line)
  end
  defp splitter(lines, []), do: lines
  defp splitter(lines, [[_| match] | rest]) do
    lines
    |> Enum.map(fn line -> String.split(line, match, trim: true) end)
    |> List.flatten()
    |> splitter(rest)
  end

  defp tag_line(nil, line), do: line
  defp tag_line([_| name], line) do
    "[USER] #{name} " <> line
  end
end
