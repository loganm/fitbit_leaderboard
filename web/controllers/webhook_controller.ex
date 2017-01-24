defmodule FitbitLeaderboard.WebhookController do
  use FitbitLeaderboard.Web, :controller

  # Verification action
  def index(conn, %{"verify" => verify}) do
    if verify === System.get_env("VERIFY_CODE") do
      send_resp conn, 204, "No Content"
    else
      send_resp conn, 404, "Not Found"
    end
  end

  # Default action if no parameters are provided
  def index(conn, _params) do
    send_resp conn, 404, "Not Found"
  end
end
