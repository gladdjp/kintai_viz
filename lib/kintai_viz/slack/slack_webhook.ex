defmodule KintaiViz.SlackWebhook do
  alias KintaiViz.Messages
  alias KintaiViz.Accounts

  def handle_webhook(%{"type" => "message", "subtype" => subtype}) do
    IO.puts("Ignore subtype #{subtype}")
  end

  def handle_webhook(%{"type" => "message"} = params) do
    %{"channel" => channel, "text" => text, "ts" => ts, "user" => user} = params
    kintai_time = get_kintai_time(text)
    IO.puts "::::: Save message '#{inspect params}'"
    Messages.create_slack_message(%{
      slack_user_id: user,
      message: text,
      ts: ts,
      channel: channel,
      client_msg_id:  "",
      kintai_time: kintai_time
    })
    KintaiVizWeb.Endpoint.broadcast(
      "slack_message:lobby",
      "message_created",
      %{message: text, slack_user_id: user, kintai_time: kintai_time})
  end

  def handle_webhook(_params) do
    # Just do nothing
  end

  def create_user(slack_user_id) do
    Process.sleep(500);
    slack_user = case Accounts.get_user_by_slack_user_id(slack_user_id) do
      nil ->
        %{"user" => user} = Slack.Web.Users.info(slack_user_id)
        {:ok, user} = Accounts.create_user(%{
          slack_user_id: slack_user_id,
          username: user["profile"]["real_name"],
          image_url: user["profile"]["image_192"]
        })

        IO.puts("Create user #{slack_user_id}")
        user
      slack_user ->
        IO.puts("Found slack user #{slack_user.slack_user_id} ")
        slack_user
    end
    KintaiVizWeb.Endpoint.broadcast(
      "slack_message:lobby",
      "user_created",
      %{
        username: slack_user.username,
        image_url: slack_user.image_url,
        slack_user_id: slack_user.slack_user_id
      }
    )
  end

  defp get_kintai_time(message) do
    pattern = ~r/(leave|本日|)(\d\d)(.*)(\d\d)(退勤|時退社|退社|ごろ退社|で退勤|退勤|時出社|出社)/u
    case Regex.run(pattern, message) do
      nil -> nil
      [_, _, hour, _, minute, _] -> "#{hour}:#{minute}"
    end
  end

end
