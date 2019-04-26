defmodule NewPhoenixWeb.PageController do
  use NewPhoenixWeb, :controller

  def index(conn, %{"woot" => _woot}) do
    render(conn, "index.html")
  end
end
