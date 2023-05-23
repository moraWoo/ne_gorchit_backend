defmodule NeGorchitBackendWeb.MenuJSON do
  alias NeGorchitBackend.Restaurant.Menu

  @doc """
  Renders a list of food_menu.
  """
  def index(%{food_menu: food_menu}) do
    %{data: for(menu <- food_menu, do: data(menu))}
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
      price: menu.price
    }
  end
end
