defmodule KintaiViz.SlackWebhook do
  alias KintaiViz.Messages

  def handle_webhook(%{"type" => "message", "subtype" => subtype}) do
    IO.puts("Ignore subtype #{subtype}")
  end

  def handle_webhook(%{"type" => "message"} = params) do
    %{"channel" => channel, "text" => text, "ts" => ts, "user" => user} = params
    IO.puts "Save message '#{text}'"
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

end
# %{"api_app_id" => "AHTFBG2FL",
# "authed_users" => ["UC1F1LLBX"],
# "event" => %{
#   "bot_id" => "B0VD4HX25",
#   "channel" => "CDJFKD8M6",
#   "channel_type" => "channel",
#   "event_ts" => "1556186224.028900",
#   "icons" => %{"image_48" => "https://s3-us-west-2.amazonaws."},
#   "subtype" => "bot_message",
#   "text" => "【0]",
#   "ts" => "1556186224.028900",
#   "type" => "message",
#   "username" => "GLADD"},
#   "event_id" => "EvJ646DVFX", "event_time" => 1556186224, "team_id" => "T067CF4P7", "token" => "ZX3GeqR6AMBbJNIa0ZV0ACIs", "type" => "event_callback"}
