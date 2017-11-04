defmodule Rumbl.Medias.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Medias.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string

    # field :user_id, :id
    belongs_to :user, Rumbl.User

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
