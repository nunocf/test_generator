defmodule PDFWriter do
  alias Stylesheet

  def generate_test(questions, final_filename) do
    questions
    |> HTMLWriter.test()
    |> PdfGenerator.generate_binary!()
    |> (&File.write("#{final_filename}.pdf", &1)).()
  end

  def generate_answer_sheet(questions, final_filename) do
    questions
    |> HTMLWriter.answer_sheet()
    |> PdfGenerator.generate_binary!()
    |> (&File.write("#{final_filename}.pdf", &1)).()
  end
end
