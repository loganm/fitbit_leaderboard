defmodule FitbitLeaderboard.Router do
  use FitbitLeaderboard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FitbitLeaderboard do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/auth", AuthController, :index
    get "/auth/callback", AuthController, :callback
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FitbitLeaderboard do
  #   pipe_through :api
  # end
end
