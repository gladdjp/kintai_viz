defmodule KintaiViz.Repo.Migrations.AddKintaiTimeToSlackMessages do
  use Ecto.Migration

  def change do
    alter table(:slack_messages) do
      add :kintai_time, :text
    end
  end
end
