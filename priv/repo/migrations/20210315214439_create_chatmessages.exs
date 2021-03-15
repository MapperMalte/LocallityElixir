defmodule Locallity002.Repo.Migrations.CreateChatmessages do
  use Ecto.Migration

  def change do
    create table(:chatmessages) do
      add :chatroom_id, references(:chatrooms, on_delete: :nothing)
      add :message_id, references(:messages, on_delete: :nothing)

      timestamps()
    end

    create index(:chatmessages, [:chatroom_id])
    create index(:chatmessages, [:message_id])
  end
end
