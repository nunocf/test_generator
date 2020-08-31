defmodule HTMLWriter do
  require EEx
  EEx.function_from_file(:def, :test, "template_test.html.eex", [:questions])
  EEx.function_from_file(:def, :answer_sheet, "template_answer_sheet.html.eex", [:questions])
end
