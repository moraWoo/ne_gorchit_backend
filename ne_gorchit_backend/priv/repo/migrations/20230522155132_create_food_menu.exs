defmodule NeGorchitBackend.Repo.Migrations.CreateFoodMenu do
  use Ecto.Migration

  def change do
    create table(:food_menu) do
      add :name, :string
      add :description, :text
      add :price, :float

      timestamps()
    end
  end
end
