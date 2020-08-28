defmodule PDFWriter do
  alias Stylesheet

  def generate_test(questions, final_filename) do
    HTMLWriter.test(questions)
    |> PdfGenerator.generate_binary!()
    |> (&File.write("#{final_filename}.pdf", &1)).()
  end

  def generate_answer_sheet(questions, final_filename) do
    HTMLWriter.answer_sheet(questions)
    |> PdfGenerator.generate_binary!()
    |> (&File.write("#{final_filename}.pdf", &1)).()
  end
end
