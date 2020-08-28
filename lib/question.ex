defmodule Question do
  alias Answer
  defstruct question_text: "", answers: []

  def new({question_text, answers}) do
    %__MODULE__{question_text: String.trim(question_text), answers: Answer.new_answers(answers)}
  end

  def new_question_list(stream) do
    Enum.map(stream, &new/1)
  end
end
