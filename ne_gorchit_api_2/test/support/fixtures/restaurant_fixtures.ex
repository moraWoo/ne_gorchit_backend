defmodule NeGorchitApi2.RestaurantFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NeGorchitApi2.Restaurant` context.
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
      |> NeGorchitApi2.Restaurant.create_menu()

    menu
  end
end
