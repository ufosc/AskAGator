defmodule AskAGatorWeb.PageController do
  use AskAGatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
