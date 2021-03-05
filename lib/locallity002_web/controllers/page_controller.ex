defmodule Locallity002Web.PageController do
  use Locallity002Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
