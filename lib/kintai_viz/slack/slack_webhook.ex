defmodule KintaiViz.SlackWebhook do
  alias KintaiViz.Messages
  alias KintaiViz.Accounts

  def handle_webhook(%{"type" => "message", "subtype" => subtype}) do
    IO.puts("Ignore subtype #{subtype}")
  end

  def handle_webhook(%{
        "type" => "message",
        "channel" => channel,
        "text" => message,
        "ts" => ts,
        "user" => slack_user_id
      }) do
    # Process.sleep(3000);
    kintai_time = get_kintai_time(message)
    IO.puts("::::: Save message '#{message}'")

    Messages.create_slack_message(%{
      ts: ts,
      channel: channel,
      message: message,
      slack_user_id: slack_user_id,
      kintai_time: kintai_time
    })

    KintaiVizWeb.Endpoint.broadcast(
      "slack_message:lobby",
      "message_created",
      %{message: message, slack_user_id: slack_user_id, kintai_time: kintai_time}
    )
  end

  def handle_webhook(_params) do
    IO.puts("::::: Unrecognize params, do nothing.")
  end

  def create_user(nil) do
    IO.puts("::::: Can't create/look-up user with nil value")
  end

  def create_user(slack_user_id) do
    Process.sleep(5000)

    slack_user =
      case Accounts.get_user_by_slack_user_id(slack_user_id) do
        nil ->
          %{"user" => user} = Slack.Web.Users.info(slack_user_id)

          {:ok, user} =
            Accounts.create_user(%{
              slack_user_id: slack_user_id,
              username: user["profile"]["real_name"],
              image_url: user["profile"]["image_512"]
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
    pattern = ~r/(leave|本日)*(\d\d)(.*)(\d\d)(退勤|時退社|退社|に退社|ごろ退社|で退勤|退勤|時出社|出社)/u

    case Regex.run(pattern, message) do
      nil -> nil
      [_, _, hour, _, minute, _] -> "#{hour}:#{minute}"
    end
  end
end
