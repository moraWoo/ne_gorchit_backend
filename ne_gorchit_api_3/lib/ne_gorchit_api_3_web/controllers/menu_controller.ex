defmodule NeGorchitApi3Web.MenuController do
  use NeGorchitApi3Web, :controller

  alias NeGorchitApi3.Restaurant
  alias NeGorchitApi3.Restaurant.Menu

  action_fallback NeGorchitApi3Web.FallbackController

  def index(conn, _params) do
    items = Restaurant.list_items()
    render(conn, :index, items: items)
  end

  def create(conn, %{"menu" => menu_params}) do
    with {:ok, %Menu{} = menu} <- Restaurant.create_menu(menu_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/items/#{menu}")
      |> render(:show, menu: menu)
    end
  end

  def show(conn, %{"id" => id}) do
    menu = Restaurant.get_menu!(id)
    render(conn, :show, menu: menu)
  end

  def update(conn, %{"id" => id, "menu" => menu_params}) do
    menu = Restaurant.get_menu!(id)

    with {:ok, %Menu{} = menu} <- Restaurant.update_menu(menu, menu_params) do
      render(conn, :show, menu: menu)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu = Restaurant.get_menu!(id)

    with {:ok, %Menu{}} <- Restaurant.delete_menu(menu) do
      send_resp(conn, :no_content, "")
    end
  end
end
