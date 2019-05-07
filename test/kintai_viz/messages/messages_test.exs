defmodule KintaiViz.MessagesTest do
  use KintaiViz.DataCase

  alias KintaiViz.Messages

  @valid_attrs %{
    channel: "some channel",
    client_msg_id: "some client_msg_id",
    message: "some message",
    slack_user_id: "some slack_user_id",
    ts: "some ts"
  }
  @update_attrs %{
    channel: "some updated channel",
    client_msg_id: "some updated client_msg_id",
    message: "some updated message",
    slack_user_id: "some updated slack_user_id",
    ts: "some updated ts"
  }
  @invalid_attrs %{channel: nil, client_msg_id: nil, message: nil, slack_user_id: nil, ts: nil}

  def slack_message_fixture(attrs \\ %{}) do
    {:ok, slack_message} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Messages.create_slack_message()

    slack_message
  end

  describe "slack_messages" do
    alias KintaiViz.Messages.SlackMessage

    test "list_slack_messages/0 returns all slack_messages" do
      slack_message = slack_message_fixture()
      assert Messages.list_slack_messages() == [slack_message]
    end

    test "get_slack_message!/1 returns the slack_message with given id" do
      slack_message = slack_message_fixture()
      assert Messages.get_slack_message!(slack_message.id) == slack_message
    end

    test "create_slack_message/1 with valid data creates a slack_message" do
      assert {:ok, %SlackMessage{} = slack_message} = Messages.create_slack_message(@valid_attrs)
      assert slack_message.channel == "some channel"
      assert slack_message.client_msg_id == "some client_msg_id"
      assert slack_message.message == "some message"
      assert slack_message.slack_user_id == "some slack_user_id"
      assert slack_message.ts == "some ts"
    end

    test "create_slack_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_slack_message(@invalid_attrs)
    end

    test "update_slack_message/2 with valid data updates the slack_message" do
      slack_message = slack_message_fixture()

      assert {:ok, %SlackMessage{} = slack_message} =
               Messages.update_slack_message(slack_message, @update_attrs)

      assert slack_message.channel == "some updated channel"
      assert slack_message.client_msg_id == "some updated client_msg_id"
      assert slack_message.message == "some updated message"
      assert slack_message.slack_user_id == "some updated slack_user_id"
      assert slack_message.ts == "some updated ts"
    end

    test "update_slack_message/2 with invalid data returns error changeset" do
      slack_message = slack_message_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Messages.update_slack_message(slack_message, @invalid_attrs)

      assert slack_message == Messages.get_slack_message!(slack_message.id)
    end

    test "delete_slack_message/1 deletes the slack_message" do
      slack_message = slack_message_fixture()
      assert {:ok, %SlackMessage{}} = Messages.delete_slack_message(slack_message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_slack_message!(slack_message.id) end
    end

    test "change_slack_message/1 returns a slack_message changeset" do
      slack_message = slack_message_fixture()
      assert %Ecto.Changeset{} = Messages.change_slack_message(slack_message)
    end
  end
end
