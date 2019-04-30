defmodule KintaiVizWeb.Router do
  use KintaiVizWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :slack_webhook do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KintaiVizWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
    resources "/slack_messages", SlackMessageController
  end

  scope "/slack", KintaiVizWeb do
    pipe_through :slack_webhook

    post "/webhook", Slack.WebhookController, :webhook
  end

  # Other scopes may use custom stacks.
  # scope "/api", KintaiVizWeb do
  #   pipe_through :api
  # end
end
