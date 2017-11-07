defmodule Rumbl.Medias.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Medias.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string

    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Medias.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:description, :title, :url, :category_id])
    |> validate_required([:description, :title, :url])
    |> assoc_constraint(:category)
  end
end
