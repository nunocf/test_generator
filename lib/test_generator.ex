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
  def generate_test(path, number_of_questions, test_name) do
    questions =
      path
      |> load_data()
      |> take_questions(number_of_questions)

    questions
    |> generate_pdfs(test_name)
  end

  defp load_data(path) do
    path
    |> XLSParser.load_data()
    |> Question.new_question_list()
  end

  defp take_questions(question_list, number_of_questions) do
    Enum.take_random(question_list, number_of_questions)
  end

  defp generate_pdfs(questions, test_name) do
    PDFWriter.generate_test(questions, test_name)
    PDFWriter.generate_answer_sheet(questions, "#{test_name}_answers")
  end
end
