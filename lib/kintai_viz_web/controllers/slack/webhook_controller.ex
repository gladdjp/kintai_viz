defmodule KintaiVizWeb.Slack.WebhookController do
  use KintaiVizWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def status(conn, params) do
    KintaiViz.SlackWebhook.handle_webhook(params)
    conn |> put_status(200) |> text("200")
  end
end
