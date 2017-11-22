defmodule Rumbl.Medias.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Medias.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :slug, :string

    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Medias.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:description, :title, :url, :category_id])
    |> slugify_title()
    |> validate_required([:description, :title, :url])
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end
