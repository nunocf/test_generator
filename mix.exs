defmodule TestGenerator.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_generator,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [applications: [:xlsxir, :pdf_generator, :logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:xlsxir, "~> 1.6"},
      {:pdf_generator, "~> 0.6.2"}
    ]
  end
end
