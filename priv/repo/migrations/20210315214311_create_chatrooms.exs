defmodule Locallity002.Repo.Migrations.CreateChatrooms do
  use Ecto.Migration

  def change do
    create table(:chatrooms) do
      add :type, :integer

      timestamps()
    end

  end
end
