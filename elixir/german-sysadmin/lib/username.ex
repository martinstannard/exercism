defmodule Username do
  def sanitize(username) do
    reduce = fn c, a ->
      a ++
        case c do
          c when c in ?a..?z -> [c]
          ?ä -> 'ae'
          ?ö -> 'oe'
          ?ü -> 'ue'
          ?ß -> 'ss'
          ?_ -> '_'
          _ -> ''
        end
    end
    Enum.reduce(username, '', reduce)
  end
end
