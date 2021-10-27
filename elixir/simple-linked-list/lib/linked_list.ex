defmodule LinkedListNode do
  defstruct data: nil, next: nil
end

defmodule LinkedList do
  @opaque t :: tuple()

  defstruct data: nil, next: nil

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    %LinkedList{}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  #def push(%{data: nil}, elem), do: %LinkedList{data: elem, next: nil}
  def push(list, elem), do: %LinkedList{data: elem, next: list}

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    count(0, list)
  end

  def count(c, %{data: nil}), do: c
  def count(c, node), do: count(c + 1, node.next)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(%{data: nil}), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(%{data: nil}), do: {:error, :empty_list}
  def peek(list), do: {:ok, list.data}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(%{data: nil, next: nil}), do: {:error, :empty_list}
  def tail(%{next: nil} = list), do: {:ok, list}
  def tail(%{next: list}), do: {:ok, list}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(%{data: nil, next: nil}), do: {:error, :empty_list}
  def pop(%{data: data, next: next}), do: {:ok, data, next}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
    |> Enum.reverse
    |> Enum.reduce(LinkedList.new, fn(e, acc) ->
      LinkedList.push(acc, e)
    end)
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(%{data: nil}), do: []
  def to_list(list) do
    {_, newlist} =
      (0..LinkedList.length(list) - 1)
      |> Enum.reduce({list, []}, fn(e, {l, a}) ->
        {:ok, data, next} = LinkedList.pop(l)
        {next, [data | a]}
      end)
    Enum.reverse(newlist)
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    list
    |> LinkedList.to_list()
    |> Enum.reverse
    |> LinkedList.from_list()
  end
end
