defmodule KintaiViz.SlackWebhook do
  alias KintaiViz.Messages
  alias KintaiViz.Accounts

  def handle_webhook(%{"type" => "message", "subtype" => subtype}) do
    IO.puts("Ignore subtype #{subtype}")
  end

  def handle_webhook(%{"type" => "message"} = params) do
    %{"channel" => channel, "text" => text, "ts" => ts, "user" => user} = params

    IO.puts "::::: Save message '#{inspect params}'"
    Messages.create_slack_message(%{
      slack_user_id: user,
      message: text,
      ts: ts,
      channel: channel,
      client_msg_id:  ""
    })
    KintaiVizWeb.Endpoint.broadcast("slack_message:lobby", "message_created", %{message: text, slack_user_id: user})
  end

  def handle_webhook(_params) do
    # Just do nothing
  end

  def create_user(slack_user_id) do
    # Process.sleep(3000);
    case Accounts.get_user_by_slack_user_id(slack_user_id) do
      nil ->
        %{"user" => user} = Slack.Web.Users.info(slack_user_id)
        {:ok, user} = Accounts.create_user(%{
          slack_user_id: slack_user_id,
          username: user["profile"]["real_name"],
          image_url: user["profile"]["image_192"]
        })
        KintaiVizWeb.Endpoint.broadcast(
          "slack_message:lobby",
          "user_created",
          %{
            username: user.username,
            image_url: user.image_url,
            slack_user_id: user.slack_user_id
          }
        )
        IO.puts("Create user #{slack_user_id}")
      slack_user ->
        IO.puts("Found slack user #{slack_user.slack_user_id} ")
    end
  end

end
