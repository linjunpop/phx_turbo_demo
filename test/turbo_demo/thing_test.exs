defmodule TurboDemo.ThingTest do
  use TurboDemo.DataCase

  alias TurboDemo.Thing

  describe "todos" do
    alias TurboDemo.Thing.Todo

    import TurboDemo.ThingFixtures

    @invalid_attrs %{title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Thing.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Thing.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Todo{} = todo} = Thing.create_todo(valid_attrs)
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Thing.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Thing.update_todo(todo, update_attrs)
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Thing.update_todo(todo, @invalid_attrs)
      assert todo == Thing.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Thing.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Thing.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Thing.change_todo(todo)
    end
  end
end
