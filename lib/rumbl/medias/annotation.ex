defmodule Rumbl.Medias.Annotation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Medias.Annotation

  schema "annotations" do
    field :at, :integer
    field :body, :string
    belongs_to :user, Rumbl.User
    belongs_to :video, Rumbl.Video

    timestamps()
  end

  @doc false
  def changeset(%Annotation{} = annotation, attrs) do
    annotation
    |> cast(attrs, [:body, :at])
    |> validate_required([:body, :at])
  end
end
