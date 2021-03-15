defmodule Locallity002.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :delivered, :boolean, default: false, null: false
      add :seen, :boolean, default: false, null: false
      add :sender_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:sender_id])
  end
end
