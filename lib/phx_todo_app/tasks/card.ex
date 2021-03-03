defmodule PhxTodoApp.Tasks.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :done, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:name, :done])
    |> validate_required([:name, :done])
  end
end
