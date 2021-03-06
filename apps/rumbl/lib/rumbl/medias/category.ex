defmodule Rumbl.Medias.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Rumbl.Medias.Category


  schema "categories" do
    field :name, :string

    timestamps()
  end

  def alphabetical(query) do
    from c in query, order_by: c.name
  end

  def names_and_ids(query) do
    from c in query, select: {c.name, c.id}
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
