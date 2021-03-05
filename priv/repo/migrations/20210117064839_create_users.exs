defmodule Locallity002.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :vorname, :string
      add :nachname, :string
      add :email, :string
      add :bio, :string
      add :accepts_conditions, :boolean, default: false, null: false

      timestamps()
    end
  end
end
