# TestGenerator

Small utility program that takes a CSV with questions and generates a PDF with a test with a subset of the answers.

## Requirements

This uses `elixir-pdf-generator`, which requires `wkhtmltopdf` to be installed.

### installing wkhtmltopdf

#### Mac

`brew install Caskroom/cask/wkhtmltopdf`

### Running it

It expects a XLS/X file with a header (which will be skipped).
Question type must be on column 2, questions on column 5, question difficulty on column 6 and answers on column 7.
The answers are all in a box, separated by a `#`.

run `iex -S mix` to start the app.

then:

`TestGenerator.generate_test("./spreadsheet_location.xlsx", 2, "test_name")`

This will generate a test based on questions in the provided spreadsheet, the number passed is how many questions per difficulty per type, and an additional answer key will be generated alonside it.
