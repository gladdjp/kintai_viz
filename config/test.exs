use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kintai_viz, KintaiVizWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :kintai_viz, KintaiViz.Repo,
  username: System.get_env("TEST_DB_USERNAME"),
  password: System.get_env("TEST_DB_PASSWORD"),
  database: System.get_env("TEST_DB"),
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
