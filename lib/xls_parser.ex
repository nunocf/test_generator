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
      %{question_text: nil} -> true
      %{answers: nil} -> true
      %{difficulty: nil} -> true
      %{type: nil} -> true
      _ -> false
    end)
  end

  defp extract_question([_, type, _, _, question, _, difficulty, answers | _t] = row)
       when is_list(row) do
    %{question_text: question, answers: answers, type: type, difficulty: difficulty}
  end
end
