defmodule TestGeneratorTest do
  use ExUnit.Case
  doctest TestGenerator

  test "greets the world" do
    assert TestGenerator.hello() == :world
  end
end
