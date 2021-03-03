defmodule PhxTodoApp.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
