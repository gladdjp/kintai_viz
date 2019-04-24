defmodule KintaiViz.Repo do
  use Ecto.Repo,
    otp_app: :kintai_viz,
    adapter: Ecto.Adapters.Postgres
end
