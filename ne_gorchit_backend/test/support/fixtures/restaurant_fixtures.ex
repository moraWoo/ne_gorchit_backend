defmodule NeGorchitBackend.RestaurantFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NeGorchitBackend.Restaurant` context.
  """

  @doc """
  Generate a menu.
  """
  def menu_fixture(attrs \\ %{}) do
    {:ok, menu} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: 120.5
      })
      |> NeGorchitBackend.Restaurant.create_menu()

    menu
  end
end
