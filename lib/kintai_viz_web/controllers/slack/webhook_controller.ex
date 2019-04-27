defmodule KintaiVizWeb.Slack.WebhookController do
  use KintaiVizWeb, :controller

  def webhook(conn, params) do
    KintaiViz.SlackSuperVisor.handle_webhook(params["event"])
    conn |> put_status(200) |> text("200")
  end
end
