defmodule TodoListManagerTest do
  use ExUnit.Case
  doctest TodoListManager

  test "greets the world" do
    assert TodoListManager.hello() == :world
  end
end
