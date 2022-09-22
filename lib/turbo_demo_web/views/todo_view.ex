defmodule TurboDemoWeb.TodoView do
  use TurboDemoWeb, :view

  def dom_id(str) when is_binary(str) do
    str
    |> String.downcase()
    |> String.replace("-", "_")
  end

  def dom_id(str_list) when is_list(str_list) do
    str_list
    |> Enum.map(&dom_id/1)
    |> Enum.join("_")
  end
end
