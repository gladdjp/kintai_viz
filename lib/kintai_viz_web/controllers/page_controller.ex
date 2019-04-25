defmodule KintaiVizWeb.PageController do
  use KintaiVizWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def status(conn, params) do
    # render(conn, "index.html")
    text(conn, "#{params["challenge"]}")
  end
end
