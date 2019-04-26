defmodule KintaiVizWeb.Slack.WebhookController do
  use KintaiVizWeb, :controller

  def status(conn, params) do
    KintaiViz.SlackSuperVisor.handle_webhook(params["event"])
    conn |> put_status(200) |> text("200")
  end
end
