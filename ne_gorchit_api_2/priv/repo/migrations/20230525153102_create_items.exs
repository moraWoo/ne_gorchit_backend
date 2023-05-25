defmodule NeGorchitApi2.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :text
      add :price, :float
      add :image, :string

      timestamps()
    end
  end
end
