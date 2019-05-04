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
    KintaiVizWeb.Endpoint.broadcast("slack_message:lobby", "message_created", %{message: text})
  end

  def handle_webhook(_params) do
    # IO.puts "nooo"
  end

  def create_user(slack_user_id) do

    case Accounts.get_user_by_slack_user_id(slack_user_id) do
      nil ->
        {:ok, user} = Accounts.create_user(%{slack_user_id: slack_user_id})
        KintaiVizWeb.Endpoint.broadcast("slack_message:lobby", "user_created", %{user: user})
        IO.puts("Create user #{slack_user_id}")
      slack_user ->
        IO.puts("Found slack user #{slack_user.slack_user_id} ")
    end
  end

end
