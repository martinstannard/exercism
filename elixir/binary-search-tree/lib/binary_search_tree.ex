defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) do
    if tree.data >= data do
      %{data: tree.data, left: insert_left(tree.left, data), right: tree.right}
    else
      %{data: tree.data, left: tree.left, right: insert_right(tree.right, data)}
    end
  end

  def insert_left(nil, data) do
    %{data: data, left: nil, right: nil}
  end
  def insert_left(tree, data) do
    insert(tree, data)
  end

  def insert_right(nil, data) do
    %{data: data, left: nil, right: nil}
  end
  def insert_right(tree, data) do
    insert(tree, data)
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    get_data(tree.left, tree, tree.right)
  end

  defp get_data(nil, tree, nil), do: [tree.data]
  defp get_data(left, tree, nil) do
    get_data(left.left, left, left.right) ++ [tree.data]
  end
  defp get_data(nil, tree, right) do
    [tree.data] ++ get_data(right.left, right, right.right)
  end
  defp get_data(left, tree, right) do
    get_data(left.left, left, left.right) ++ [tree.data] ++ get_data(right.left, right, right.right)
  end
end
