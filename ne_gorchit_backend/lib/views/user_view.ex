defmodule NeGorchitBackendWeb.UserView do
  use NeGorchitBackendWeb.UserView :view

  def render("menu.json", %{users: users}) do
    render_many(menu, __MODULE__, "menu.json")
  end

  def render("menu.json", %{user: user}) do
    %{
      id: ["id"],
      name: ["name"],
      description: ["description"],
      price: ["price"]
    }
  end
end
