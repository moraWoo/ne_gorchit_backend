defmodule NeGorchitBackend.RestaurantTest do
  use NeGorchitBackend.DataCase

  alias NeGorchitBackend.Restaurant

  describe "food_menu" do
    alias NeGorchitBackend.Restaurant.Menu

    import NeGorchitBackend.RestaurantFixtures

    @invalid_attrs %{description: nil, name: nil, price: nil}

    test "list_food_menu/0 returns all food_menu" do
      menu = menu_fixture()
      assert Restaurant.list_food_menu() == [menu]
    end

    test "get_menu!/1 returns the menu with given id" do
      menu = menu_fixture()
      assert Restaurant.get_menu!(menu.id) == menu
    end

    test "create_menu/1 with valid data creates a menu" do
      valid_attrs = %{description: "some description", name: "some name", price: 120.5}

      assert {:ok, %Menu{} = menu} = Restaurant.create_menu(valid_attrs)
      assert menu.description == "some description"
      assert menu.name == "some name"
      assert menu.price == 120.5
    end

    test "create_menu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurant.create_menu(@invalid_attrs)
    end

    test "update_menu/2 with valid data updates the menu" do
      menu = menu_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", price: 456.7}

      assert {:ok, %Menu{} = menu} = Restaurant.update_menu(menu, update_attrs)
      assert menu.description == "some updated description"
      assert menu.name == "some updated name"
      assert menu.price == 456.7
    end

    test "update_menu/2 with invalid data returns error changeset" do
      menu = menu_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurant.update_menu(menu, @invalid_attrs)
      assert menu == Restaurant.get_menu!(menu.id)
    end

    test "delete_menu/1 deletes the menu" do
      menu = menu_fixture()
      assert {:ok, %Menu{}} = Restaurant.delete_menu(menu)
      assert_raise Ecto.NoResultsError, fn -> Restaurant.get_menu!(menu.id) end
    end

    test "change_menu/1 returns a menu changeset" do
      menu = menu_fixture()
      assert %Ecto.Changeset{} = Restaurant.change_menu(menu)
    end
  end
end
