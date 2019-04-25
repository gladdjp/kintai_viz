defmodule KintaiVizWeb.SlackMessageController do
  use KintaiVizWeb, :controller

  alias KintaiViz.Messages
  alias KintaiViz.Messages.SlackMessage

  def index(conn, _params) do
    slack_messages = Messages.list_slack_messages()
    render(conn, "index.html", slack_messages: slack_messages)
  end

  def new(conn, _params) do
    changeset = Messages.change_slack_message(%SlackMessage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"slack_message" => slack_message_params}) do
    case Messages.create_slack_message(slack_message_params) do
      {:ok, slack_message} ->
        conn
        |> put_flash(:info, "Slack message created successfully.")
        |> redirect(to: Routes.slack_message_path(conn, :show, slack_message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    slack_message = Messages.get_slack_message!(id)
    render(conn, "show.html", slack_message: slack_message)
  end

  def edit(conn, %{"id" => id}) do
    slack_message = Messages.get_slack_message!(id)
    changeset = Messages.change_slack_message(slack_message)
    render(conn, "edit.html", slack_message: slack_message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "slack_message" => slack_message_params}) do
    slack_message = Messages.get_slack_message!(id)

    case Messages.update_slack_message(slack_message, slack_message_params) do
      {:ok, slack_message} ->
        conn
        |> put_flash(:info, "Slack message updated successfully.")
        |> redirect(to: Routes.slack_message_path(conn, :show, slack_message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", slack_message: slack_message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slack_message = Messages.get_slack_message!(id)
    {:ok, _slack_message} = Messages.delete_slack_message(slack_message)

    conn
    |> put_flash(:info, "Slack message deleted successfully.")
    |> redirect(to: Routes.slack_message_path(conn, :index))
  end
end
