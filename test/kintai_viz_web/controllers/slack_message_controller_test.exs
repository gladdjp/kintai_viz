defmodule KintaiVizWeb.SlackMessageControllerTest do
  use KintaiVizWeb.ConnCase

  alias KintaiViz.Messages

  @create_attrs %{
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

  def fixture(:slack_message) do
    {:ok, slack_message} = Messages.create_slack_message(@create_attrs)
    slack_message
  end

  describe "index" do
    test "lists all slack_messages", %{conn: conn} do
      conn = get(conn, Routes.slack_message_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Slack messages"
    end
  end

  describe "new slack_message" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.slack_message_path(conn, :new))
      assert html_response(conn, 200) =~ "New Slack message"
    end
  end

  describe "create slack_message" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.slack_message_path(conn, :create), slack_message: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.slack_message_path(conn, :show, id)

      conn = get(conn, Routes.slack_message_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Slack message"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.slack_message_path(conn, :create), slack_message: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Slack message"
    end
  end

  describe "edit slack_message" do
    setup [:create_slack_message]

    test "renders form for editing chosen slack_message", %{
      conn: conn,
      slack_message: slack_message
    } do
      conn = get(conn, Routes.slack_message_path(conn, :edit, slack_message))
      assert html_response(conn, 200) =~ "Edit Slack message"
    end
  end

  describe "update slack_message" do
    setup [:create_slack_message]

    test "redirects when data is valid", %{conn: conn, slack_message: slack_message} do
      conn =
        put(conn, Routes.slack_message_path(conn, :update, slack_message),
          slack_message: @update_attrs
        )

      assert redirected_to(conn) == Routes.slack_message_path(conn, :show, slack_message)

      conn = get(conn, Routes.slack_message_path(conn, :show, slack_message))
      assert html_response(conn, 200) =~ "some updated channel"
    end

    test "renders errors when data is invalid", %{conn: conn, slack_message: slack_message} do
      conn =
        put(conn, Routes.slack_message_path(conn, :update, slack_message),
          slack_message: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Slack message"
    end
  end

  describe "delete slack_message" do
    setup [:create_slack_message]

    test "deletes chosen slack_message", %{conn: conn, slack_message: slack_message} do
      conn = delete(conn, Routes.slack_message_path(conn, :delete, slack_message))
      assert redirected_to(conn) == Routes.slack_message_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.slack_message_path(conn, :show, slack_message))
      end
    end
  end

  defp create_slack_message(_) do
    slack_message = fixture(:slack_message)
    {:ok, slack_message: slack_message}
  end
end
