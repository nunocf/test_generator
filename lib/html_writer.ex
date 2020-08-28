defmodule HTMLWriter do
  require EEx
  EEx.function_from_file(:def, :test, "template.html.eex", [:questions])
  EEx.function_from_file(:def, :answer_sheet, "template2.html.eex", [:questions])
end
