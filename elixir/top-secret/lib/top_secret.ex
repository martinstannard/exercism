defmodule TopSecret do
  def to_ast(string) do
    {:ok, ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part(ast, acc) do
    # Please implement the decode_secret_message_part/2 function
  end

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
