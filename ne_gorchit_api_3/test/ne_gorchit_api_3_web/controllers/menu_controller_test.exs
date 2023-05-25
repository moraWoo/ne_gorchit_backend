defmodule NeGorchitApi3Web.MenuControllerTest do
  use NeGorchitApi3Web.ConnCase

  import NeGorchitApi3.RestaurantFixtures

  alias NeGorchitApi3.Restaurant.Menu

  @create_attrs %{
    description: "some description",
    image: "some image",
    name: "some name",
    price: 120.5
  }
  @update_attrs %{
    description: "some updated description",
    image: "some updated image",
    name: "some updated name",
    price: 456.7
  }
  @invalid_attrs %{description: nil, image: nil, name: nil, price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all items", %{conn: conn} do
      conn = get(conn, ~p"/api/items")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create menu" do
    test "renders menu when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/items", menu: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/items/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "image" => "some image",
               "name" => "some name",
               "price" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/items", menu: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update menu" do
    setup [:create_menu]

    test "renders menu when data is valid", %{conn: conn, menu: %Menu{id: id} = menu} do
      conn = put(conn, ~p"/api/items/#{menu}", menu: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/items/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "image" => "some updated image",
               "name" => "some updated name",
               "price" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, menu: menu} do
      conn = put(conn, ~p"/api/items/#{menu}", menu: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete menu" do
    setup [:create_menu]

    test "deletes chosen menu", %{conn: conn, menu: menu} do
      conn = delete(conn, ~p"/api/items/#{menu}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/items/#{menu}")
      end
    end
  end

  defp create_menu(_) do
    menu = menu_fixture()
    %{menu: menu}
  end
end
