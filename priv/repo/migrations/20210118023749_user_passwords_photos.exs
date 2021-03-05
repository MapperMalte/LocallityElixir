defmodule Locallity002.Repo.Migrations.UserPasswordsPhotos do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :password_hash, :string, default: ""
      add :photo_url, :string, default: ""
    end
  end
end
