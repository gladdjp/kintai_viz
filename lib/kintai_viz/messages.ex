defmodule KintaiViz.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias KintaiViz.Repo

  alias KintaiViz.Messages.SlackMessage

  @doc """
  Returns the list of slack_messages.

  ## Examples

      iex> list_slack_messages()
      [%SlackMessage{}, ...]

  """
  def list_slack_messages do
    Repo.all(SlackMessage)
  end

  @doc """
  Gets a single slack_message.

  Raises `Ecto.NoResultsError` if the Slack message does not exist.

  ## Examples

      iex> get_slack_message!(123)
      %SlackMessage{}

      iex> get_slack_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slack_message!(id), do: Repo.get!(SlackMessage, id)

  @doc """
  Creates a slack_message.

  ## Examples

      iex> create_slack_message(%{field: value})
      {:ok, %SlackMessage{}}

      iex> create_slack_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slack_message(attrs \\ %{}) do
    %SlackMessage{}
    |> SlackMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slack_message.

  ## Examples

      iex> update_slack_message(slack_message, %{field: new_value})
      {:ok, %SlackMessage{}}

      iex> update_slack_message(slack_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slack_message(%SlackMessage{} = slack_message, attrs) do
    slack_message
    |> SlackMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SlackMessage.

  ## Examples

      iex> delete_slack_message(slack_message)
      {:ok, %SlackMessage{}}

      iex> delete_slack_message(slack_message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slack_message(%SlackMessage{} = slack_message) do
    Repo.delete(slack_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slack_message changes.

  ## Examples

      iex> change_slack_message(slack_message)
      %Ecto.Changeset{source: %SlackMessage{}}

  """
  def change_slack_message(%SlackMessage{} = slack_message) do
    SlackMessage.changeset(slack_message, %{})
  end
end
