defmodule KintaiVizWeb.Router do
  use KintaiVizWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KintaiVizWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/status", PageController, :status
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KintaiVizWeb do
  #   pipe_through :api
  # end
end
