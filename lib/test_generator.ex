defmodule TestGenerator do
  alias XLSParser
  alias Question
  alias PDFWriter

  @moduledoc """
  Documentation for TestGenerator.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TestGenerator.hello()
      :world

  """
  def generate_test(path, questions_per_difficulty, test_name) do
    path
    |> load_data()
    |> take_questions(questions_per_difficulty)
    |> generate_pdfs(test_name)
  end

  defp load_data(path) do
    path
    |> XLSParser.load_data()
    |> Question.new_question_map()
  end

  defp take_questions(questions_map, count_per_difficulty) do
    questions_map
    |> Enum.map(fn {_type, questions_by_type} ->
      questions_by_type
      |> Enum.group_by(& &1.difficulty)
      |> Enum.map(fn {_difficulty, questions_by_difficulty} ->
        Enum.take_random(questions_by_difficulty, count_per_difficulty)
      end)
    end)
    |> List.flatten()
    |> Enum.shuffle()
  end

  defp generate_pdfs(questions, test_name) do
    PDFWriter.generate_test(questions, test_name)
    PDFWriter.generate_answer_sheet(questions, "#{test_name}_answers")
  end
end
