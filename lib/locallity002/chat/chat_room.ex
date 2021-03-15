defmodule Locallity002.Chat.ChatRoom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chatrooms" do
    field :type, :integer

    timestamps()
  end

  @doc false
  def changeset(chat_room, attrs) do
    chat_room
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
