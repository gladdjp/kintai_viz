defmodule KintaiVizWeb.Slack.WebhookControllerTest do
  use KintaiVizWeb.ConnCase

  test "POST /slack/webhook", %{conn: conn} do
    conn = post(conn, "/slack/webhook")
    assert text_response(conn, 200) =~ "200"
  end
end
