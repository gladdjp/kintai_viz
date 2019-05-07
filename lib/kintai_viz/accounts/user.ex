defmodule KintaiViz.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :image_url, :string
    field :slack_user_id, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :slack_user_id, :image_url])
    |> validate_required([:slack_user_id])
  end
end
