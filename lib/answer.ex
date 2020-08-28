defmodule Answer do
  defstruct answer_text: "", correct: false

  defp new(answer_text, correct) do
    %__MODULE__{answer_text: String.trim(answer_text), correct: correct}
  end

  def new_answers(answers) when is_binary(answers) do
    answers
    |> String.split("#")
    |> Enum.with_index()
    |> Enum.map(fn {answer_text, index} -> new(answer_text, index == 0) end)
    |> Enum.shuffle()
  end
end
