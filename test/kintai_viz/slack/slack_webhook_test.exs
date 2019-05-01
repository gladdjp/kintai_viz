defmodule KintaiViz.SlackWebhookTest do
  use KintaiViz.DataCase

  @valid_message_param %{"type" => "message", "channel" => "channel", "text" => "text", "ts" => "ts", "user" => "user"}
  @invalid_message_param Map.merge(@valid_message_param, %{"subtype" => "subtype"})

  describe "slack_webhook" do
    test "handle_webhook/1 saves message if it contained no subtype" do
      KintaiViz.SlackWebhook.handle_webhook(@valid_message_param)
      messages = KintaiViz.Messages.list_slack_messages
      assert length(messages) == 1
    end

    test "handle_webhook/1 ignores message if it contained subtype" do
      KintaiViz.SlackWebhook.handle_webhook(@in_valid_message_param)
      assert KintaiViz.Messages.list_slack_messages == []
    end
  end
end
