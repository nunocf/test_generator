defmodule Question do
  alias Answer
  defstruct question_text: "", answers: [], type: "", difficulty: ""

  def new(%{question_text: question_text, answers: answers, type: type, difficulty: difficulty}) do
    %__MODULE__{
      question_text: String.trim(question_text),
      answers: Answer.new_answers(answers),
      type: type,
      difficulty: difficulty
    }
  end

  def new_question_map(stream) do
    stream
    |> Enum.map(&new/1)
    |> Enum.group_by(& &1.type)
  end
end
