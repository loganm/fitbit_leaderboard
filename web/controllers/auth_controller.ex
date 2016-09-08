defmodule FitbitLeaderboard.AuthController do
  use FitbitLeaderboard.Web, :controller

  alias FitbitLeaderboard.User

  def index(conn, _params) do
    redirect conn, external: Fitbit.authorize_url!
  end

  def callback(conn, %{"code" => code}) do
    client = Fitbit.get_token!(code: code)
    IO.inspect client

    changeset = User.changeset(%User{},
      %{user_id: client.token.other_params["user_id"],
        access_token: client.token.access_token,
        refresh_token: client.token.refresh_token
      })
    Repo.insert!(changeset)

    conn
      |> put_flash(:info, "User created successfully.")
      |> redirect(to: "/")
  end
end
