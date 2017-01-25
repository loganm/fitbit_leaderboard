defmodule FitbitLeaderboard.AuthController do
  use FitbitLeaderboard.Web, :controller

  alias FitbitLeaderboard.User

  def index(conn, _params) do
    redirect conn, external: Fitbit.authorize_url!
  end

  def callback(conn, %{"code" => code}) do
    client = Fitbit.get_token!(code: code)
    IO.inspect client

    user_id = client.token.other_params["user_id"]

    changeset = User.changeset(%User{},
      %{user_id: user_id,
        access_token: client.token.access_token,
        refresh_token: client.token.refresh_token
      })
    Repo.insert!(changeset)

    subscription_id = 1

    subscription_resource = OAuth2.Client.get!(client, "/1/user/-/activities/apiSubscriptions/#{subscription_id}.json").body

    conn
      |> put_session(:user_id, user_id)
      |> put_flash(:info, "User created successfully.")
      |> render(resource)
  end
end
