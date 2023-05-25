defmodule NeGorchitApi3.Restaurant.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :image, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:name, :description, :price, :image])
    |> validate_required([:name, :description, :price, :image])
  end
end
