defmodule FitbitLeaderboard.User do
  use FitbitLeaderboard.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :user_id, :string
    field :access_token, :binary
    field :refresh_token, :binary
    field :expires_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :user_id, :access_token, :refresh_token, :expires_at])
    |> validate_required([:user_id])
  end
end
