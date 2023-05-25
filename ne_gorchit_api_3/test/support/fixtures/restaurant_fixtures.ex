defmodule NeGorchitApi3.RestaurantFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NeGorchitApi3.Restaurant` context.
  """

  @doc """
  Generate a menu.
  """
  def menu_fixture(attrs \\ %{}) do
    {:ok, menu} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        name: "some name",
        price: 120.5
      })
      |> NeGorchitApi3.Restaurant.create_menu()

    menu
  end
end
