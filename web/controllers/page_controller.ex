defmodule FitbitLeaderboard.PageController do
  use FitbitLeaderboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
