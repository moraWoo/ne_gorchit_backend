defmodule NeGorchitApi3Web.MenuJSON do
  alias NeGorchitApi3.Restaurant.Menu

  @doc """
  Renders a list of items.
  """
  def index(%{items: items}) do
    %{data: for(menu <- items, do: data(menu))}
  end

  @doc """
  Renders a single menu.
  """
  def show(%{menu: menu}) do
    %{data: data(menu)}
  end

  defp data(%Menu{} = menu) do
    %{
      id: menu.id,
      name: menu.name,
      description: menu.description,
      price: menu.price,
      image: menu.image
    }
  end
end
