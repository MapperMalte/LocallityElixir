defmodule Locallity002.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :vorname]}
  schema "users" do
    field :accepts_conditions, :boolean, default: false
    field :bio, :string
    field :email, :string
    field :nachname, :string
    field :vorname, :string
    field :password_hash, :string
    field :photo_url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:vorname, :nachname, :email, :bio, :accepts_conditions])
    |> validate_required([:vorname, :nachname, :email, :bio, :accepts_conditions])
  end
end
