defmodule ProteinTranslation do
  @translation %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> to_codons
    |> process_codons
    |> handle_result
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    trans(@translation[codon])
  end

  defp trans(nil), do: {:error, "invalid codon"}
  defp trans(translation), do: {:ok, translation}

  defp to_codons(rna) do
    rna
    |> String.graphemes()
    |> Enum.chunk_every(3)
    |> Enum.map(fn chunk -> Enum.join(chunk, "") end)
  end

  defp process_codons(codons) do
    codons
    |> Enum.reduce_while([], fn codon, acc ->
      case of_codon(codon) do
        {:ok, "STOP"} -> {:halt, acc}
        {:ok, long} -> {:cont, acc ++ [long]}
        {:error, error} -> {:halt, {:error, "invalid RNA"}}
      end
    end)
  end

  defp handle_result(result) do
    case result do
      {:error, result} -> {:error, result}
      rest -> {:ok, rest}
    end
  end
end
