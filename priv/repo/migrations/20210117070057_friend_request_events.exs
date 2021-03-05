defmodule Locallity002.Repo.Migrations.FriendRequestEvents do
  use Ecto.Migration
  alias FriendState

  def change do
    FriendState.create_type()

    create table(:friend_request_events) do
      add :user_subject, references(:users)
      add :user_object, references(:users)
      add :friend_request_state, :friend_state
      timestamps()
    end
  end
end
