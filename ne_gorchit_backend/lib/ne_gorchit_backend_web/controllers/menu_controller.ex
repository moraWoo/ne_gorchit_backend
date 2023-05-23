defmodule NeGorchitBackendWeb.MenuController do
  use NeGorchitBackendWeb, :controller

  alias NeGorchitBackend.Restaurant
  alias NeGorchitBackend.Restaurant.Menu

  action_fallback NeGorchitBackendWeb.FallbackController

  # GET http://localhost:4000/api/v1/users/
  def index(conn, _params) do
    menu = File.read!(file) |> Poison.decode!()
    render(conn, menu: menu)
  end

  # GET http://localhost:4000/api/v1/users/1
  def show(conn, params) do
    users = File.read!(file) |> Poison.decode!()
    render(conn, user: users |> Enum.find(&(&1["id"] === String.to_integer(params["id"]))))
  end

  defp file() do
    Path.join(:code.priv_dir(:exjson), "data/menu.json")
  end

  def index(conn, _params) do
    food_menu = Restaurant.list_food_menu()
    render(conn, :index, food_menu: food_menu)
  end

  def create(conn, %{"menu" => menu_params}) do
    with {:ok, %Menu{} = menu} <- Restaurant.create_menu(menu_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/food_menu/#{menu}")
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
