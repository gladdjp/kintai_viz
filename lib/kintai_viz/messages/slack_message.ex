defmodule KintaiViz.Messages.SlackMessage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slack_messages" do
    field :channel, :string
    field :client_msg_id, :string
    field :message, :string
    field :slack_user_id, :string
    field :ts, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(slack_message, attrs) do
    slack_message
    |> cast(attrs, [:slack_user_id, :message, :ts, :channel, :client_msg_id])
    |> validate_required([:slack_user_id, :message, :ts, :channel])
  end
end
