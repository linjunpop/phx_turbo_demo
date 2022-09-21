defmodule TurboDemo.ThingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TurboDemo.Thing` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> TurboDemo.Thing.create_todo()

    todo
  end
end
