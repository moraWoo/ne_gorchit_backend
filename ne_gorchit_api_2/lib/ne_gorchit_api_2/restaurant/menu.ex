defmodule NeGorchitApi2.Restaurant.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
  end
end
