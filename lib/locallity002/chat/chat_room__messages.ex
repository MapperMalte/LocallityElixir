defmodule Locallity002.Chat.ChatRoom_Messages do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chatmessages" do
    field :chatroom_id, :id
    field :message_id, :id

    timestamps()
  end

  @doc false
  def changeset(chat_room__messages, attrs) do
    chat_room__messages
    |> cast(attrs, [])
    |> validate_required([])
  end
end
