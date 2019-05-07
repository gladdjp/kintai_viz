defmodule KintaiVizWeb.PageController do
  use KintaiVizWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
