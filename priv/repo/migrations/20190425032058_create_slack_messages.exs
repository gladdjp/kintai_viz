defmodule KintaiViz.Repo.Migrations.CreateSlackMessages do
  use Ecto.Migration

  def change do
    create table(:slack_messages) do
      add :slack_user_id, :string
      add :message, :text
      add :ts, :string
      add :channel, :string
      add :client_msg_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:slack_messages, [:user_id])
  end
end
