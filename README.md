# TestGenerator

Small utility program that takes a CSV with questions and generates a PDF with a test with a subset of the answers.

## Requirements

This uses `elixir-pdf-generator`, which requires `wkhtmltopdf` to be installed.

### installing wkhtmltopdf

#### Mac

`brew install Caskroom/cask/wkhtmltopdf`


### Running it
It expects a XLS/X file with a header (which will be skipped) and questions on column 5, and answers on column 7.
The answers are all in a box, separated by a `#`.

run `iex -S mix` to start the app.
then:

`TestGenerator.generate_test("./spreadsheet_location.xlsx", 200, "test_name")`

This will generate a 200 question test based on questions in the provided spreadsheet, and an additional answer key will be generated alonside it.
