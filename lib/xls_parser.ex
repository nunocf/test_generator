defmodule XLSParser do
  @moduledoc """
  Utilities to read XLS/XLSX files
  """

  @doc """
  Takes an XLS/XLSX file location and returns a stream.
  """
  def stream_file(path) do
    Xlsxir.stream_list(path, 0)
  end

  def load_data(path) do
    path
    |> stream_file()
    |> Enum.split(1)
    |> elem(1)
    |> Enum.map(&extract_question/1)
    |> Enum.reject(fn
      {nil, _} -> true
      {_, nil} -> true
      _ -> false
    end)
  end

  defp extract_question([_, _, _, _, question, _, _, answers | _t] = row) when is_list(row) do
    {question, answers}
  end
end
