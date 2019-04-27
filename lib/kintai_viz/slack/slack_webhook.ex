defmodule KintaiViz.SlackWebhook do
  alias KintaiViz.Messages
  alias KintaiViz.Accounts

  def handle_webhook(%{"type" => "message", "subtype" => subtype}) do
    IO.puts("Ignore subtype #{subtype}")
  end

  def handle_webhook(%{"type" => "message"} = params) do
    %{"channel" => channel, "text" => text, "ts" => ts, "user" => user} = params
    IO.puts "::::: Sleep 4000"
    Process.sleep(4000)
    IO.puts "::::: Save message '#{inspect params}'"
    Messages.create_slack_message(%{
      slack_user_id: user,
      message: text,
      ts: ts,
      channel: channel,
      client_msg_id:  ""
    })
  end

  def handle_webhook(_params) do
    # IO.puts "nooo"
  end

  def create_user(slack_user_id) do
    Process.sleep(5000)

    case Accounts.get_user_by_slack_user_id(slack_user_id) do
      nil ->
        Accounts.create_user(%{slack_user_id: slack_user_id})
        IO.puts("Create user #{slack_user_id}")
    end
  end

end
