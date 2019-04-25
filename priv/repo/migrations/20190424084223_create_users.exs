defmodule KintaiViz.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :slack_user_id, :string
      add :image_url, :string

      timestamps()
    end

  end
end
